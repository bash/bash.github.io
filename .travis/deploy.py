#!/usr/bin/env python3

import tempfile
import subprocess
from typing import List
import os
import shutil

TEMP_DIR = tempfile.tempdir()
TARGET_BRANCH = 'master'

FILES = [
    'CNAME',
    'style.css',
    'index.html',
    'icons/github.svg',
]


def _run_git_command(args: List[str]):
    subprocess.check_call(['git', '-C', TEMP_DIR, *args])


def _get_remote_url() -> str:
    remote_url = subprocess.check_output(['git', 'remote', 'get-url', 'origin'])
    github_token = os.environ['GH_TOKEN']
    return remote_url.replace('https://', f'https://{github_token}@')
    
def _clone_repository():
    subprocess.check_call(['git', 'clone', '--quiet', '-b', TARGET_BRANCH, _get_remote_url()])

def _remove_all_files():
    _run_git_command(['rm', '-r', '.'])

def _copy_files_to_repository():
    for file in FILES:
        target_path = os.path.join(TEMP_DIR, file)
        target_dir = os.path.dirname(target_path_dir)
        if not len(target_dir) == 0:
            os.makedirs(target_dir, exist_ok=True)
        shutil.copy(file, target_path)

def _commit_all_changes():
    travis_commit = os.environ['TRAVIS_COMMIT']
    _run_git_command(['commit', '-m', f'Build for {travis_commit}'])

def _push():
    _run_git_command(['push'])

_clone_repository()
_remove_all_files()
_copy_files_to_repository()
_commit_all_changes()
# _push()
