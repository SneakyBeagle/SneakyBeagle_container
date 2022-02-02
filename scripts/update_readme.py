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
    "-c",
    "--new-content",
    help="Content to place between the markers",
    type=str,
    required=True,
)
parser.add_argument(
    "-f",
    "--file",
    help="File to update, if not README.md in the root",
    type=str,
    default="README.md",
    nargs="?",
)
parser.add_argument("-b", "--branch", help="Repository branch", type=str, required=True)
parser.add_argument(
    "-sm",
    "--start-marker",
    help="The marker to start replacement from. For example '<!---START-MARK--->'",
    type=str,
    default="<!---START-MARK--->",
    nargs="?",
)
parser.add_argument(
    "-em",
    "--end-marker",
    help="The marker to end replacement at. For example '<!---END-MARK--->'",
    type=str,
    default="<!---END-MARK--->",
    nargs="?",
)
parser.add_argument(
    "-m",
    "--commit-message",
    help="Commit message",
    type=str,
    default="docs: Automated README update",
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

upload_lines = []
if args.start_marker in lines:
    # Search for the markers
    start = lines.index(args.start_marker)
    assert (
        args.end_marker in lines
    ), "No end marker found. You probably forgot to place it or gave the wrong argument."

    end = lines.index(args.end_marker)
    assert (
        end > start
    ), "The end marker needs to be further along than the start. Did something go wrong with your markers?"

    # Generate the new file contents
    upload_lines = lines[: start + 1] + args.new_content.split("\n") + lines[end:]
    upload_content = "\n".join(upload_lines)

    # Commit to the branch
    repo.update_file(
        args.file, args.commit_message, upload_content, contents.sha, branch=args.branch
    )
else:
    print("No markers found")
