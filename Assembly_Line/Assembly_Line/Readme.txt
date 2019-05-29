架构说明：

- 目前是大端存储，疑问 : 改成小端存储需要改译码阶段吗？
- 哈佛结构，指令在get_instr.v中读取，数据在access_mem中读取，里面测试数据需要自行修改
- 目前只写了ori指令，我看了五个阶段的输出波形都是正常的，但是测试可能不严格，或许会出错。

mips.v : 顶层模块
defines.vh ： 一些定义的宏

图片序号 -> 模块名(.v)
----------
- 取指阶段
1. get_pc
2. get_instr
3. PC_ALU
- 取指->译码过渡
4. instr_decode
- 译码阶段
5. decode
6. control_unit
7. regfile
8. sig_extend
9. shift_unit
10. get_PCBranchD
11. get_PCSrcD
- 译码->执行过渡
12. decode_exe
- 执行阶段
13. get_SrcAE
14. get_WriteDataE
15. get_SrcBE
16. SrcAE_SrcBE_ALU
17. get_WriteRegE
- 执行->访存过渡
18. exe_accessMem
- 访存阶段
19. access_mem
- 访存->回写过渡
20. accessMem_writeback
- 回写阶段
21. get_ResultW
- 冲突处理模块
22. hazard_unit

