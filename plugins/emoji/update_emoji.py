"""
Update Emoji.py
Refeshes OMZ emoji database based on the latest Unicode spec
"""
import re
import json

spec = open("emoji-data.txt", "r")

# Regexes
# regex_emoji will return, respectively:
# the code points, its type (status), the actual emoji, and its official name
regex_emoji = r"^([\w ].*?\S)\s*;\s*([\w-]+)\s*#\s*(.*?)\s(\S.*).*$"
# regex_group returns the group of subgroup that a line opens
regex_group = r"^#\s*(group|subgroup):\s*(.*)$"

headers = """
# emoji-char-definitions.zsh - Emoji definitions for oh-my-zsh emoji plugin
#
# This file is auto-generated by update_emoji.py. Do not edit it manually.
#
# This contains the definition for:
#   $emoji         - which maps character names to Unicode characters
#   $emoji_flags   - maps country names to Unicode flag characters using region
#                    indicators
#   $emoji_mod     - maps modifier components to Unicode characters
#   $emoji_groups  - a single associative array to avoid cluttering up the
#                    global namespace, and to allow adding additional group
#                    definitions at run time. The keys are the group names, and
#                    the values are whitespace-separated lists of emoji
#                    character names.

# Main emoji
typeset -gAH emoji
# National flags
typeset -gAH emoji_flags
# Combining modifiers
typeset -gAH emoji_mod
# Emoji groups
typeset -gAH emoji_groups
"""

#######
# Adding country codes
#######
# This is the only part of this script that relies on an external library
# (country_converter), and is hence commented out by default.
# You can uncomment it to have country codes added as aliases for flag
# emojis. (By default, when you install this extension, country codes are
# included as aliases, but not if you re-run this script without uncommenting.)
# Warning: country_converter is very verbose, and will print warnings all over
# your terminal.

# import country_converter as coco # pylint: disable=wrong-import-position
# cc = coco.CountryConverter()

# def country_iso(_all_names, _omz_name):
#     """ Using the external library country_converter,
<<<<<<< HEAD
#         this function can detect the ISO2 and ISO3 codes
=======
#         this funciton can detect the ISO2 and ISO3 codes
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
#         of the country. It takes as argument the array
#         with all the names of the emoji, and returns that array."""
#     omz_no_underscore = re.sub(r'_', r' ', _omz_name)
#     iso2 = cc.convert(names=[omz_no_underscore], to='ISO2')
#     if iso2 != 'not found':
#         _all_names.append(iso2)
#         iso3 = cc.convert(names=[omz_no_underscore], to='ISO3')
#         _all_names.append(iso3)
#     return _all_names


#######
# Helper functions
#######

def code_to_omz(_code_points):
    """ Returns a ZSH-compatible Unicode string from the code point(s) """
    return r'\U' + r'\U'.join(_code_points.split(' '))

def name_to_omz(_name, _group, _subgroup, _status):
    """ Returns a reasonable snake_case name for the emoji. """
    def snake_case(_string):
        """ Does the regex work of snake_case """
        remove_dots = re.sub(r'\.\(\)', r'', _string)
        replace_ands = re.sub(r'\&', r'and', remove_dots)
        remove_whitespace = re.sub(r'[^\#\*\w]', r'_', replace_ands)
        return re.sub(r'__', r'_', remove_whitespace)

    shortname = ""
    split_at_colon = lambda s: s.split(": ")
    # Special treatment by group and subgroup
    # If the emoji is a flag, we strip "flag" from its name
    if _group == "Flags" and len(split_at_colon(_name)) > 1:
        shortname = snake_case(split_at_colon(_name)[1])
    else:
        shortname = snake_case(_name)
    # Special treatment by status
    # Enables us to have every emoji combination,
    # even the one that are not officially sanctionned
<<<<<<< HEAD
    # and are implemented by, say, only one vendor
=======
    # and are implemeted by, say, only one vendor
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    if _status == "unqualified":
        shortname += "_unqualified"
    elif _status == "minimally-qualified":
        shortname += "_minimally"
    return shortname

def increment_name(_shortname):
    """ Increment the short name by 1. If you get, say,
    'woman_detective_unqualified', it returns
    'woman_detective_unqualified_1', and then
    'woman_detective_unqualified_2', etc. """
    last_char = _shortname[-1]
    if last_char.isdigit():
        num = int(last_char)
        return _shortname[:-1] + str(num + 1)
    return _shortname + "_1"

########
# Going through every line
########

group, subgroup, short_name_buffer = "", "", ""
emoji_database = []
for line in spec:
    # First, test if this line opens a group or subgroup
    group_match = re.findall(regex_group, line)
    if group_match != []:
        gr_or_sub, name = group_match[0]
        if gr_or_sub == "group":
            group = name
        elif gr_or_sub == "subgroup":
            subgroup = name
        continue # Moving on...
    # Second, test if this line references one emoji
    emoji_match = re.findall(regex_emoji, line)
    if emoji_match != []:
        code_points, status, emoji, name = emoji_match[0]
        omz_codes = code_to_omz(code_points)
        omz_name = name_to_omz(name, group, subgroup, status)
        # If this emoji has the same shortname as the preceding one
        if omz_name in short_name_buffer:
            omz_name = increment_name(short_name_buffer)
        short_name_buffer = omz_name
        emoji_database.append(
            [omz_codes, status, emoji, omz_name, group, subgroup])
spec.close()

########
# Write to emoji-char-definitions.zsh
########

# Aliases for emojis are retrieved through the DB of Gemoji
# Retrieved on Aug 9 2019 from the following URL:
# https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json

gemoji_db = open("gemoji_db.json")
j = json.load(gemoji_db)
aliases_map = {entry['emoji']: entry['aliases'] for entry in j}
all_omz_names = [emoji_data[3] for emoji_data in emoji_database]

# Let's begin writing to this file
output = open("emoji-char-definitions.zsh", "w")
output.write(headers)

emoji_groups = {"fruits": "\n", "vehicles": "\n", "hands": "\n",
                "people": "\n", "animals": "\n", "faces": "\n",
                "flags": "\n"}

# First, write every emoji down
for _omz_codes, _status, _emoji, _omz_name, _group, _subgroup in emoji_database:

    # One emoji can be mapped to multiple names (aliases or country codes)
    names_for_this_emoji = [_omz_name]

    # Variable that indicates in which map the emoji will be located
    emoji_map = "emoji"
    if _status == "component":
        emoji_map = "emoji_mod"
    if _group == "Flags":
        emoji_map = "emoji_flags"
        # Adding country codes (Optional, see above)
        # names_for_this_emoji = country_iso(names_for_this_emoji, _omz_name)

    # Check if there is an alias available in the Gemoji DB
    if _emoji in aliases_map.keys():
        for alias in aliases_map[_emoji]:
            if alias not in all_omz_names:
                names_for_this_emoji.append(alias)

    # And now we write to the definitions file
    for one_name in names_for_this_emoji:
        output.write(f"{emoji_map}[{one_name}]=$'{_omz_codes}'\n")

    # Storing the emoji in defined subgroups for the next step
    if _status == "fully-qualified":
        if _subgroup == "food-fruit":
            emoji_groups["fruits"] += f"  {_omz_name}\n"
        elif "transport-" in _subgroup:
            emoji_groups["vehicles"] += f"  {_omz_name}\n"
        elif "hand-" in _subgroup:
            emoji_groups["hands"] += f"  {_omz_name}\n"
        elif "person-" in _subgroup or _subgroup == "family":
            emoji_groups["people"] += f"  {_omz_name}\n"
        elif "animal-" in _subgroup:
            emoji_groups["animals"] += f"  {_omz_name}\n"
        elif "face-" in _subgroup:
            emoji_groups["faces"] += f"  {_omz_name}\n"
        elif _group == "Flags":
            emoji_groups["flags"] += f"  {_omz_name}\n"

# Second, write the subgroups to the end of the file
for name, string in emoji_groups.items():
    output.write(f'\nemoji_groups[{name}]="{string}"\n')
output.close()
