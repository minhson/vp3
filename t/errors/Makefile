default: all

# What to build

FILES := \
error1a.v \
error1b.v \
error1c.v \
sub.v \
werror.v \
include.v \

# Build options

VP3_OPTS := -y .

# these tests don't produce proper output
TOP :=

# Build exceptions

VP3_OPTS.werror := -w

VP3_SHOULD_FAIL.error1a := 1
VP3_SHOULD_FAIL.error1b := 1
VP3_SHOULD_FAIL.error1c := 1
VP3_SHOULD_FAIL.werror := 1
VP3_SHOULD_FAIL.include := 1

# Dependencies

error1.run_vp3: sub.run_vp3

error1a.run_vp3: sub.run_vp3

error1b.run_vp3: sub.run_vp3

error1c.run_vp3: sub.run_vp3

# Special tests for pass1out handling

.PHONY: error1a.vp error1b.vp error1c.vp

# Check that we overwrite previous output
error1a.vp:
	cp error1.vp $@
	echo "// Generated by vp3" > error1a.v.preprocessed

# Check that we don't overwrite random files
error1b.vp:
	cp error1.vp $@
	echo "Not vp3 output" > error1b.v.preprocessed

# Check that we save preprocessor output if the file doesn't exist
error1c.vp:
	cp error1.vp $@
	rm -f error1c.v.preprocessed

include ../rules.make
