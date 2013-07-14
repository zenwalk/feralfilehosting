[celadon ~/spideroak] ~/spideroak/SpiderOak --help
Usage: SpiderOak basic command line usage:

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -v, --verbose         be verbose: show detailed status information as it
                        happens
  --redirect=FILE       Redirect console output to file
  -d NUMBER, --device=NUMBER
                        operate on specified device id (default is the local
                        device)
  -o DIR, --output=DIR  Target dir to restore items to (default is normal
                        download dir)
  --enable-schedule     honor the set activity schedule, even in batchmode
                        (normally the schedule is ignored in batchmode)
  --disable-schedule    disable activity scheduling

  Operational Modes and Commands:
    --scan, --scan-only
                        scan the filesystem for changes and report a summary
    --build, --scan-and-build-only
                        scan the filesystem, and build all possible file
                        system changes as shelved upload transactions, and
                        exit without uploading them
    --sync              like batchmode, but only backup/update synced folders
    --backup=TARGET     ad hoc operation: backup whatever exists at TARGET in
                        the filesystem and exit (ignores existing backup
                        selection.)
    --restore=item      Restore a folder, file, or version.
                        Run "--restore help" for more info
    --batchmode         like headless, but will exit when all available work
                        is done
    --headless          run in headless mode (without the graphical interface)
    --merge             merge and restore the contents of multiple paths from
                        arbitrary devices:  dev1:path1 .. devN:pathN
    --purge=item        purge a folder, file (including historical versions)

  Information Commands:
    --userinfo, --user-info
                        Show user and device info
    --shelved-x, --print-shelved-x
                        Show information about each shelved upload transaction
    --space             Show space usage information by category and by device
    --tree              Show the hierarchy of stored backup folders
    --fulllist          Show all folders and files stored on device
    --tree-changelog    Show a log of how the hierarchy of stored backup
                        folders has changed over time
    --journal-changelog=folder_or_journal
                        Show the changelog of a given folder

  Backup Selection Manipulation Commands:
    --force             Do in/exclusion even if the path doesn't exist
    --selection, --print-selection
                        Show a list of selected and excluded backup items
    --reset-selection   Reset selection (but preserve excluded files)
    --exclude-file=EXCLUDE_FILE
                        Exclude the given file from the selection
    --exclude-dir=EXCLUDE_DIR
                        Exclude the given directory from the selection
    --include-dir=INCLUDE_DIR
                        Include the given directory from the selection

  Maintenance Commands:
    --rebuild-reference-database
                        rebuild the SpiderOak reference database (can take
                        awhile)
    --billing           print a secure web auto-login URL for billing info
    --destroy-shelved-x
                        destroy each shelved upload transaction already in
                        progress.
    --repair            repair a local SpiderOak installation
    --purge-historical-versions
                         purge historical versions of a folder, file:
                        "all": purge all historical versions of all files; '
                        "hM,dN,w": hourly for last M hours, daily for last N
                        days, weekly thereafter          (also accepts
                        (m)onthly and (y)early); '     no option: hourly for
                        last 24 hours, daily for last month, then weekly
                        thereafter
    --purge-deleted-items=PURGE_DELETED_ITEMS
                        purge deleted items older than N days
    --vacuum            Vacuum SpiderOak's local database (rebuilds indexs and
                        reclaims local disk space)
    --list-orphan-external-files
                        list parent_id's of unreferenced external block files
    --convert-to-hybrid-db
                        convert SpiderOak's local database to use external
                        files
    --generate-previews
                        generate missing image previews for the local device

  Dangerous/Support Commands:
    Caution: Do not use these commands unless advised by SpiderOak
    support.  They can damage your installation if used improperly.

    --apply-subscription-xact
                        apply all transactions previously received from remote
                        devices -- (not intended for general use -- this
                        normally happens automatically)
    --empty-garbage-bin
                        purge all deleted items on the current device
    --orphans=ACTION    help, find, free orphans
    --request-diagnostic
                         This is similar to asking the user to send us log
                        files, in that it gives us  access to meta-information
                        about their account including file names and  space
                        usage. It does not however give us plain text access
                        to any keys or  actual data -- just metadata.

  Account Commands:
    --bootstrap=ACCOUNT_DEFINITION_FILE
                        Read a json definition file and use contents to create
                        a new account (Deprecated - use --setup instead.)
    --setup=SETUP_FILE  Read a json definition file and use contents to create
                        a new account. See https://spideroak.com/faq/how_do_i_
                        set_up_a_new_user_from_the_commandline for more info,
                        or use '--setup=-' to prompt for setup details.

  Share Commands:
    --share-password=SHARE_PASSWORD
                        optional password for --create-share
    --list-shares       List shares
    --create-share=CREATE_SHARE
                        Create an xact with a new share. run 'help' for
                        syntaxt
    --delete-share=DELETE_SHARE
                        Create an xact deleting a share
[celadon ~/spideroak] 