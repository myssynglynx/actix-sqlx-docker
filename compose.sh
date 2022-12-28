#! /bin/bash
# run docker-compose.dev.yml file with arg as command

ENV="dev"
CMD="up"

# Count arguments & throw error if args exceed.
limit_args() {
    COUNT=1
    FLAG=$1
    LIMIT=$2
    shift
    shift
    while test $COUNT -lt $#; do
        # If next env arg is a flag, break
        if [[ ${@:$(($COUNT+1))} =~ ^- ]] && [[ $COUNT -eq $LIMIT ]]; then
            break
        # If next arg is a flag, throw error at current count
        elif [[ ${@:$(($COUNT+1))} =~ ^- ]]; then
            echo "$COUNT arguments given for '${FLAG}'. Only $LIMIT expected."
            exit 1
        # If final arg, throw error at total count
        elif [[ $(($COUNT+1)) -eq $# ]]; then
            echo "$# arguments given for '${FLAG}'. Only $LIMIT expected."
            exit 1
        fi
        ((COUNT++))
    done
}

while test $# -gt 0; do
    case $1 in
        -h|--help)
            echo "Execute docker-compose commands to specific environments"
            echo " "
            echo "sh compose.sh [[-o,--options] | command]"
            echo "(docker-compose -f docker-compose.[ENV].yml [CMD]"
            echo " "
            echo "options:"
            echo "-h, --help                show brief help"
            echo "-c, --command             specify command for docker-compose,"
            echo "                            formatted as string (default='up')"
            echo "-e, --env                 specify which environment to command"
            echo "                            (default='dev')"
            exit 0
            ;;
        -e|--env)
            shift
            if test $# -gt 1; then
                ENV=$1
                limit_args 'environment' 1 $@
            elif test $# -gt 0; then
                if [ $1 != "dev" ] && [ $1 != "prod" ]; then
                    echo "Invalid environment specified (must be 'dev' or 'prod')"
                    exit 1
                fi
                ENV=$1
            else
                echo "No environment given"
                exit 1
            fi
            shift
            ;;
        -c|--command)
            shift
            if test $# -gt 1; then
                CMD=$1
                limit_args 'command' 1 $@
            elif test $# -gt 0; then
                CMD=$1
            else
                echo "No command given"
                exit 1
            fi
            shift
            ;;
        *)
            CMD=$@
            break
            ;;
    esac
done

docker-compose -f "docker-compose.$ENV.yml" $CMD
