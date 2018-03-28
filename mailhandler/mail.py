#!/usr/bin/env python
from __future__ import with_statement
from argparse import ArgumentParser
from subprocess import run, CalledProcessError

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('subject')
    parser.add_argument('message_source')
    parser.add_argument('destination', nargs='?', default='jyn514@gmail.com')
    args = parser.parse_args()
    cli_args = ['mail', '-s', "Website visitor: " + args.subject,
                args.destination]

    try:
        with open(args.message_source) as f:
            run(cli_args, stdin=f).check_returncode()
    except CalledProcessError:
        with open('WARNINGS', 'a') as f:
            f.write('WARNING: Failed to send message to ' + args.destination
                    + ' with subject ' + args.subject + ' and body at '
                    + args.message_source + '\n')
    except FileNotFoundError:
        with open("WARNINGS", 'a') as f:
            f.write("WARNING: source file " + args.message_source
                    + ' not found\n')

