!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 5.0E-002  &
   spacing_for_grid = 1.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.controls
!
!------------------------------ Adams/View Model ------------------------------!
!
!
model create  &
   model_name = SCARA_IRCCyN
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.q1  &
   adams_id = 1  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.q2  &
   adams_id = 2  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.x  &
   adams_id = 3  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.y  &
   adams_id = 4  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.qd1  &
   adams_id = 5  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .SCARA_IRCCyN.qd2  &
   adams_id = 6  &
   initial_condition = 0.0  &
   function = ""
!
data_element create plant input  &
   plant_input_name = .SCARA_IRCCyN.PINPUT_1  &
   adams_id = 1  &
   variable_name =  &
      .SCARA_IRCCyN.qd1,  &
      .SCARA_IRCCyN.qd2
!
data_element create plant output  &
   plant_output_name = .SCARA_IRCCyN.POUTPUT_1  &
   adams_id = 1  &
   variable_name =  &
      .SCARA_IRCCyN.x,  &
      .SCARA_IRCCyN.y,  &
      .SCARA_IRCCyN.q1,  &
      .SCARA_IRCCyN.q2
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .SCARA_IRCCyN.steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+011  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .SCARA_IRCCyN.ground.MARKER_Reference  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.ground.MARKER_Fix_Ground1  &
   adams_id = 15  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .SCARA_IRCCyN.ground  &
   material_type = .SCARA_IRCCyN.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .SCARA_IRCCyN.ground.POINT_O  &
   location = 0.0, 0.0, 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .SCARA_IRCCyN.ground  &
   name_visibility = off
!
!------------------------------------ Base ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
part create rigid_body name_and_position  &
   part_name = .SCARA_IRCCyN.Base  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.Base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Ori_Base  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Ori_Base  &
   visibility = off
!
marker create  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Axis_Motor1  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Axis_Motor1_1  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_CM_Base  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.12476  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Fix_Ground2  &
   adams_id = 14  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .SCARA_IRCCyN.Base  &
   mass = 25.958  &
   center_of_mass_marker = .SCARA_IRCCyN.Base.MARKER_CM_Base  &
   inertia_marker = .SCARA_IRCCyN.Base.MARKER_CM_Base  &
   ixx = 0.319  &
   iyy = 0.319  &
   izz = 0.511  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .SCARA_IRCCyN.Base.catia_stl  &
   reference_marker = .SCARA_IRCCyN.Base.MARKER_Ori_Base  &
   file_name = "catia_stl.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .SCARA_IRCCyN.Base  &
   color = BLUE_GRAY
!
!------------------------------------ Prox ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
part create rigid_body name_and_position  &
   part_name = .SCARA_IRCCyN.Prox  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.Prox
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Ori_Prox  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Ori_Prox  &
   visibility = off
!
marker create  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2  &
   adams_id = 6  &
   location = 0.5, 0.0, 0.22  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor1_2  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2_1  &
   adams_id = 10  &
   location = 0.5, 0.0, 0.22  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_CM_Prox  &
   adams_id = 12  &
   location = 0.144545, 0.0, 0.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .SCARA_IRCCyN.Prox  &
   mass = 24.146  &
   center_of_mass_marker = .SCARA_IRCCyN.Prox.MARKER_CM_Prox  &
   inertia_marker = .SCARA_IRCCyN.Prox.MARKER_CM_Prox  &
   ixx = 0.323  &
   iyy = 1.406  &
   izz = 1.246  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .SCARA_IRCCyN.Prox.catia_stl  &
   reference_marker = .SCARA_IRCCyN.Prox.MARKER_Ori_Prox  &
   file_name = "catia_stl_2.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .SCARA_IRCCyN.Prox  &
   color = PEACH
!
!------------------------------------ Dist ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
part create rigid_body name_and_position  &
   part_name = .SCARA_IRCCyN.Dist  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.Dist
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_Ori_Dist  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_Ori_Dist  &
   visibility = off
!
marker create  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_Axis_Motor2_2  &
   adams_id = 9  &
   location = 0.5, 0.0, 0.22  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_CM_Dist  &
   adams_id = 13  &
   location = 0.529481, 0.0, 0.22  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_end_effector  &
   adams_id = 16  &
   location = 0.8, 0.0, 0.22  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .SCARA_IRCCyN.Dist  &
   mass = 8.305  &
   center_of_mass_marker = .SCARA_IRCCyN.Dist.MARKER_CM_Dist  &
   inertia_marker = .SCARA_IRCCyN.Dist.MARKER_CM_Dist  &
   ixx = 4.4E-002  &
   iyy = 9.1E-002  &
   izz = 5.7E-002  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .SCARA_IRCCyN.Dist.catia_stl  &
   reference_marker = .SCARA_IRCCyN.Dist.MARKER_Ori_Dist  &
   file_name = "catia_stl_3.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .SCARA_IRCCyN.Dist  &
   color = MAIZE
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .SCARA_IRCCyN.JOINT_Motor1  &
   adams_id = 1  &
   i_marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor1_2  &
   j_marker_name = .SCARA_IRCCyN.Base.MARKER_Axis_Motor1_1
!
constraint attributes  &
   constraint_name = .SCARA_IRCCyN.JOINT_Motor1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .SCARA_IRCCyN.JOINT_Motor2  &
   adams_id = 2  &
   i_marker_name = .SCARA_IRCCyN.Dist.MARKER_Axis_Motor2_2  &
   j_marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2_1
!
constraint attributes  &
   constraint_name = .SCARA_IRCCyN.JOINT_Motor2  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .SCARA_IRCCyN.JOINT_Fix_Ground  &
   adams_id = 3  &
   i_marker_name = .SCARA_IRCCyN.Base.MARKER_Fix_Ground2  &
   j_marker_name = .SCARA_IRCCyN.ground.MARKER_Fix_Ground1
!
constraint attributes  &
   constraint_name = .SCARA_IRCCyN.JOINT_Fix_Ground  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .SCARA_IRCCyN.Last_Sim  &
   commands = "simulation single_run assemble model_name=.SCARA_IRCCyN"
!
!-------------------------- Adams/View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .SCARA_IRCCyN.general_motion_1  &
   definition_name = .MDI.Constraints.general_motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .SCARA_IRCCyN.general_motion_2  &
   definition_name = .MDI.Constraints.general_motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_1  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_2  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.i_marker  &
   object_value = (.SCARA_IRCCyN.Prox.MARKER_Axis_Motor1_2)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.j_marker  &
   object_value = (.SCARA_IRCCyN.Base.MARKER_Axis_Motor1_1)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.constraint  &
   object_value = (.SCARA_IRCCyN.JOINT_Motor1)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t3_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r3_type  &
   integer_value = 2
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t3_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r3_func  &
   string_value = "VARVAL(.SCARA_IRCCyN.qd1)"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.t3_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_1.r3_ic_velo  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.general_motion_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.i_marker  &
   object_value = (.SCARA_IRCCyN.Dist.MARKER_Axis_Motor2_2)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.j_marker  &
   object_value = (.SCARA_IRCCyN.Prox.MARKER_Axis_Motor2_1)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.constraint  &
   object_value = (.SCARA_IRCCyN.JOINT_Motor2)
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t3_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r3_type  &
   integer_value = 2
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t3_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r3_func  &
   string_value = "VARVAL(.SCARA_IRCCyN.qd2)"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.t3_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .SCARA_IRCCyN.general_motion_2.r3_ic_velo  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.general_motion_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.input_channels  &
   object_value =   &
      .SCARA_IRCCyN.q1,  &
      .SCARA_IRCCyN.q2
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.output_channels  &
   object_value =   &
      .SCARA_IRCCyN.x,  &
      .SCARA_IRCCyN.y
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.file_name  &
   string_value = "SCARA_Control_Plant"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.host  &
   string_value = "pc-d05-11.eleves.ecn"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_1.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.input_channels  &
   object_value =   &
      .SCARA_IRCCyN.qd1,  &
      .SCARA_IRCCyN.qd2
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.output_channels  &
   object_value =   &
      .SCARA_IRCCyN.x,  &
      .SCARA_IRCCyN.y,  &
      .SCARA_IRCCyN.q1,  &
      .SCARA_IRCCyN.q2
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.file_name  &
   string_value = "Controls_Plant_2"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.host  &
   string_value = "pc-d05-11.eleves.ecn"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .SCARA_IRCCyN.Controls_Plant_2.output_rate  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_2
!
undo end_block
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = -9.80665
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Adams/View Variables ----------------------------!
!
!
variable create  &
   variable_name = .SCARA_IRCCyN._model  &
   string_value = ".SCARA_IRCCyN"
!
!---------------------------- Function definitions ----------------------------!
!
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.q1  &
   function = "AZ(.SCARA_IRCCyN.Prox.MARKER_Axis_Motor1_2, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1_1)"
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.q2  &
   function = "AZ(.SCARA_IRCCyN.Dist.MARKER_Axis_Motor2_2, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2_1)"
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.x  &
   function = "DX(.SCARA_IRCCyN.Dist.MARKER_end_effector, .SCARA_IRCCyN.ground.MARKER_Reference)"
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.y  &
   function = "DY(.SCARA_IRCCyN.Dist.MARKER_end_effector, .SCARA_IRCCyN.ground.MARKER_Reference)"
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.qd1  &
   function = "0"
!
data_element modify variable  &
   variable_name = .SCARA_IRCCyN.qd2  &
   function = "0"
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.general_motion_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.general_motion_2
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_1
!
!-------------------------- Adams/View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .SCARA_IRCCyN.Controls_Plant_2
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.ground.MARKER_Reference  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.POINT_O))
!
marker modify  &
   marker_name = .SCARA_IRCCyN.ground.MARKER_Fix_Ground1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.POINT_O))
!
material modify  &
   material_name = .SCARA_IRCCyN.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+011(Newton/meter**2))
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Ori_Base  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   relative_to = .SCARA_IRCCyN.Base
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Axis_Motor1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0.3}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   relative_to = .SCARA_IRCCyN.Base
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Axis_Motor1_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   relative_to = .SCARA_IRCCyN.Base
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_CM_Base  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0.12476}, .SCARA_IRCCyN.ground.POINT_O))  &
   relative_to = .SCARA_IRCCyN.Base
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Base.MARKER_Fix_Ground2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.POINT_O))  &
   relative_to = .SCARA_IRCCyN.Base
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Ori_Prox  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   relative_to = .SCARA_IRCCyN.Prox
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2  &
   location =   &
      (LOC_RELATIVE_TO({0.5, 0, 0.22}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   relative_to = .SCARA_IRCCyN.Prox
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor1_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   relative_to = .SCARA_IRCCyN.Prox
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   relative_to = .SCARA_IRCCyN.Prox
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Prox.MARKER_CM_Prox  &
   location =   &
      (LOC_RELATIVE_TO({0.144545, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Base.MARKER_Axis_Motor1))  &
   relative_to = .SCARA_IRCCyN.Prox
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_Ori_Dist  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.ground.MARKER_Reference))  &
   relative_to = .SCARA_IRCCyN.Dist
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_Axis_Motor2_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   relative_to = .SCARA_IRCCyN.Dist
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_CM_Dist  &
   location =   &
      (LOC_RELATIVE_TO({2.9481E-002, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   relative_to = .SCARA_IRCCyN.Dist
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
marker modify  &
   marker_name = .SCARA_IRCCyN.Dist.MARKER_end_effector  &
   location =   &
      (LOC_RELATIVE_TO({0.3, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .SCARA_IRCCyN.Prox.MARKER_Axis_Motor2))  &
   relative_to = .SCARA_IRCCyN.Dist
!
defaults coordinate_system  &
   default_coordinate_system = .SCARA_IRCCyN.ground
!
model display  &
   model_name = SCARA_IRCCyN
