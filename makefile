project = default.gpr
build = gprbuild -p -P $(project)
obj_dir = obj
bin_dir = bin
clean = gprclean -r $(project)
gen_doc = gnatdoc --enable-build -p -P $(project)
run_main = $(bin_dir)/my_main
mode_list = debug_info debug_info_and_assertions optimizations

all:
	@$(build)

clean:
	@$(clean)

thorough_clean:
	@rm -rf auto.cgpr gnatinspect.db $(obj_dir) $(bin_dir) generated_doc

doc:
	@mkdir -p $(obj_dir) $(bin_dir);
	@$(gen_doc);

run: all
	$(run_main)
