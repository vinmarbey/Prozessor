/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_23(char*, char *);
extern void execute_33(char*, char *);
extern void execute_37(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_65(char*, char *);
extern void execute_68(char*, char *);
extern void execute_73(char*, char *);
extern void execute_77(char*, char *);
extern void execute_81(char*, char *);
extern void execute_84(char*, char *);
extern void execute_88(char*, char *);
extern void execute_92(char*, char *);
extern void execute_95(char*, char *);
extern void execute_97(char*, char *);
extern void execute_101(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_141(char*, char *);
extern void execute_144(char*, char *);
extern void execute_148(char*, char *);
extern void execute_151(char*, char *);
extern void execute_162(char*, char *);
extern void execute_175(char*, char *);
extern void execute_180(char*, char *);
extern void execute_183(char*, char *);
extern void execute_187(char*, char *);
extern void execute_192(char*, char *);
extern void execute_219(char*, char *);
extern void execute_222(char*, char *);
extern void execute_226(char*, char *);
extern void execute_228(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_234(char*, char *);
extern void execute_238(char*, char *);
extern void execute_243(char*, char *);
extern void execute_253(char*, char *);
extern void execute_262(char*, char *);
extern void execute_264(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_273(char*, char *);
extern void execute_274(char*, char *);
extern void execute_275(char*, char *);
extern void execute_354(char*, char *);
extern void execute_355(char*, char *);
extern void execute_378(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void transaction_32(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_74(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_81(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_131(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_139(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_147(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_155(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_163(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_171(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_179(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_187(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_195(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_343(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_355(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_367(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_379(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_391(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_403(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_415(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_427(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[117] = {(funcp)execute_409, (funcp)execute_410, (funcp)execute_23, (funcp)execute_33, (funcp)execute_37, (funcp)execute_39, (funcp)execute_40, (funcp)execute_41, (funcp)execute_42, (funcp)execute_43, (funcp)execute_44, (funcp)execute_45, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_60, (funcp)execute_62, (funcp)execute_65, (funcp)execute_68, (funcp)execute_73, (funcp)execute_77, (funcp)execute_81, (funcp)execute_84, (funcp)execute_88, (funcp)execute_92, (funcp)execute_95, (funcp)execute_97, (funcp)execute_101, (funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_141, (funcp)execute_144, (funcp)execute_148, (funcp)execute_151, (funcp)execute_162, (funcp)execute_175, (funcp)execute_180, (funcp)execute_183, (funcp)execute_187, (funcp)execute_192, (funcp)execute_219, (funcp)execute_222, (funcp)execute_226, (funcp)execute_228, (funcp)execute_230, (funcp)execute_231, (funcp)execute_234, (funcp)execute_238, (funcp)execute_243, (funcp)execute_253, (funcp)execute_262, (funcp)execute_264, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_273, (funcp)execute_274, (funcp)execute_275, (funcp)execute_354, (funcp)execute_355, (funcp)execute_378, (funcp)execute_380, (funcp)execute_381, (funcp)transaction_32, (funcp)transaction_33, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_73, (funcp)transaction_74, (funcp)transaction_75, (funcp)transaction_76, (funcp)transaction_77, (funcp)transaction_78, (funcp)transaction_81, (funcp)transaction_131, (funcp)transaction_139, (funcp)transaction_147, (funcp)transaction_155, (funcp)transaction_163, (funcp)transaction_171, (funcp)transaction_179, (funcp)transaction_187, (funcp)transaction_195, (funcp)transaction_343, (funcp)transaction_355, (funcp)transaction_367, (funcp)transaction_379, (funcp)transaction_391, (funcp)transaction_403, (funcp)transaction_415, (funcp)transaction_427};
const int NumRelocateId= 117;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.reloc",  (void **)funcTab, 117);
	iki_vhdl_file_variable_register(dp + 97296);
	iki_vhdl_file_variable_register(dp + 97352);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/toplevel_tb_behaviour_cfg_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
