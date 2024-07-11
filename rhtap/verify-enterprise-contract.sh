#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# verify-enterprise-contract
source $SCRIPTDIR/common.sh

# Top level parameters 

function version() {
	echo "Running $TASK_NAME:version"
	ec
}

function initialize-tuf() {
	echo "Running $TASK_NAME:initialize-tuf"
	set -euo pipefail
	
	if [[ -z "${TUF_MIRROR:-}" ]]; then
	    echo 'TUF_MIRROR not set. Skipping TUF root initialization.'
	    exit
	fi
	
	echo 'Initializing TUF root...'
	cosign initialize --mirror "${TUF_MIRROR}" --root "${TUF_MIRROR}/root.json"
	echo 'Done!'
}

function validate() {
	echo "Running $TASK_NAME:validate"
	ec
}

function report() {
	echo "Running $TASK_NAME:report"
	cat
}

function report-json() {
	echo "Running $TASK_NAME:report-json"
	cat
}

function summary() {
	echo "Running $TASK_NAME:summary"
	jq
}

function assert() {
	echo "Running $TASK_NAME:assert"
	jq
}

function annotate-task() {
	echo "Running $TASK_NAME:annotate-task"
	#!/usr/bin/env bash
	echo "verify-enterprise-contract $(context.taskRun.name)"
	oc annotate taskrun $(context.taskRun.name) task.results.format=application/json
	oc annotate taskrun $(context.taskRun.name) task.results.type=ec
	oc annotate taskrun $(context.taskRun.name) task.results.container=step-report-json
	oc annotate taskrun $(context.taskRun.name) task.output.location=logs
	
}

# Task Steps 
version
initialize-tuf
validate
report
report-json
summary
assert 
exit_with_success_result
