# maxIncome finds the record with the maximum income from the file
# Parameters:	
#   a0 contains address of pointer pair array 
#      this is (0x10040000 in our example) 
#      But your code MUST handle any address value
#   a1:the number of records in the file
# Return value: 
#   a0: pointer to actual location of record stock name in file buffer
#
# Consider whether this is a leaf or nested function
# Consider what registers you may have to save and restore
# What type of register is best to use and why.
# This function must make calls to the input_from_record function.

# ------- Reword this ----------
#This function loads the binary number from the memory array 0x1005000 and compares to the previously stored max number(t1). If a new max is found the address
#is stored in a6. Once all numbers have been compared a6 is subtracted by 0x00010004 to get the address of the name record in the record pointer array
#t1 = current max / t2 = current loaded number / t6 = address conversion number
#a3 = address of number array / a6 = address of current max number in number array

maxIncome:
	mv a3, s3 # 0x10050000
	addi a3, a3, 4
	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty ###F### maxIncome Function
	li a0, 0
	ret

maxIncome_fileNotEmpty:	
# ----------Begining of student code---------
li t1, -1 #current max

MaxCrashOutLoop:
	lw t2, 0(a3) #load the income record stored in the binary array 
	check_max:
		bltz t1, set_max #checks if there's a max yet
		blt t2, t1, IncrementButNotTheOtherIncrementOrTheOtherOTherIncrement
	set_max:
		mv t1, t2
		mv a6, a3
	IncrementButNotTheOtherIncrementOrTheOtherOTherIncrement:
		addi a1, a1, -1
		addi a3, a3, 8
		bgtz a1, MaxCrashOutLoop
MaxLockIn:
		li t6, 0x00010004 #relationship between binary array and record pointer array
		sub a0, a6, t6
#---------- End student code here------------
	ret

