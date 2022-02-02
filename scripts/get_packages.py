import os
import sys

try:
    from github import Github
except ModuleNotFoundError:
    # Install if not found
    os.system("pip install PyGithub")
    from github import Github

import argparse

# ARGUMENTS #############################################
parser = argparse.ArgumentParser()
parser.add_argument(
    "-t", "--token", help="Token for Github api", type=str, required=True
)
parser.add_argument(
    "-r", "--repository", help="Github repository", type=str, required=True
)
parser.add_argument(
    "-f",
    "--file",
    help="File to update, if not README.md in the root",
    type=str,
    required=True,
)
parser.add_argument("-b", "--branch", help="Repository branch", type=str, required=True)
parser.add_argument(
    "-sm",
    "--start-marker",
    help="The marker to start reading packages from. For example '# PACKAGES #'",
    type=str,
    default="# PACKAGES #",
    nargs="?",
)
parser.add_argument(
    "-em",
    "--end-marker",
    help="The marker to end reading packages at. For example '# END PACKAGES #'",
    type=str,
    default="# END PACKAGES #",
    nargs="?",
)
args = parser.parse_args()
############################################# #############################################

# Authenticate
git = Github(args.token)

# Get contents of the file
repo = git.get_repo(args.repository)
contents = repo.get_contents(args.file, ref=args.branch)
decoded_contents = contents.decoded_content.decode("utf-8")
lines = decoded_contents.split("\n")

# Grab all the lines that are relevant
pack_lines = []
append = False
for line in lines:
    if args.start_marker in line:
        append = True
    elif args.end_marker in line:
        append = False
        break

    if append:
        pack_lines.append(line)


# Take only the packages and reformat them
pack_content = (" ".join(pack_lines)).split("=")[1].replace('"', "")
pack_content = pack_content.replace("\\", "").replace("  ", "")
packages = "- " + "\n- ".join(pack_content.split(" "))
print(packages)
