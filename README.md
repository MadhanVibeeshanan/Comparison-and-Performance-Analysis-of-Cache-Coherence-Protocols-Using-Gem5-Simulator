# Comparions-and-Performance-Analysis-of-Cache-Coherence-Protocols-Using-Gem5-Simulator
# CSCI 5593 - Advanced Computer Architecture
	Gem5 was installed and used on a dual boot Ubuntu OS during the project. 
	You can also use Ubuntu in a VM, but building the binaries will take a lot of time.

# 1. Download and Install VM:

	The link provided below will help you to install VM:
	
**https://www.howtogeek.com/196060/beginner-geek-how-to-create-and-use-virtual-machines/**

# 2. Download Ubuntu 16.04:

**http://releases.ubuntu.com/16.04/**

# 3. Install Ubuntu 16.04 on VM:

	Follow the instructions given in the link provided below to install Ubuntu 16.04 on your VM:
	
**https://medium.com/@tushar0618/install-ubuntu-16-04-lts-on-virtual-box-desktop-version-30dc6f1958d0**

# 4. Install dependent packages:

	Before installing gem5, run the following command on your Ubuntu terminal to resolve package dependencies:

**sudo apt-get install mercurial scons swig gcc m4 python python-dev libgoogle-perftools-dev g++**

# 5. Install Gem5:
	Run the command on your terminal to download and install Gem5:

**hg clone http://repo.gem5.org/gem5**

# 6. Compile and Check Gem5
	Run the following commands:
	
	1.	Go into gem5 Directory
	
**cd ~/gem5**

	2.	Build the ISA (we build X86 ISA):
	
		The number following -j represents the number of coresthat your system has. 
		This build process will take around 20 minutes based on the number of cores that you have

**scons build/X86/gem5.opt -j8**

	
	3.	Test if gem5 works:
	
		If you get Hello World! as your output, then the build is successful.
		
**build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello**

# 7. Testing MOESI Protocol in Classic model
	1.	Go into gem5 Directory if you are in any other directory.
	
**cd ~/gem5**

	2.	Build the X86 ISA:
		By default Gem5 takes classic memory model with MOESI cache coherence protocol.

**scons build/X86/gem5.opt -j8**


	3.	To run classic model on gem5 with different L1 cache size and block size.
		a.	Open memtest.py found on the following directory: 
**./configs/example/memtest.py**

b.	Change the L1 cache size, found on line 183
	Change sizes to one of these: 16kB,32kb,64kB and 128kB and follow step 4 and 5.

c.	Change the Block size, found on line 132
	Change sizes to one of these: 16, 32, 64 and 128 and follow step 4 and 5.

4.	Run the following command to execute
	The details of the parameters can be found if we run the following command.
	./build/X86/gem5.opt configs/example/memtest.py -h

The parameters -l, -c and -t can be varied as per requirement. But we used the following to test the classic model. 
 ./build/X86/gem5.opt configs/example/memtest.py -l 100000 -c 4:1 -t 3:2:1

5.	Output file will be found in the following directory:
./m5out/stats.txt

We used the data through bus values from the text file to 
test the varying L1 cache size and varying block size.

# 8. Setting up SPEC 2017
	Use the below given link to run and compile Spec 2017:
Link: https://www.spec.org/cpu2017/Docs/install-guide-unix.html

# 9. Integrating SPEC 2017 with Gem5
1.	Copy spec.sh  to ~/gem5/
	File path of spec.sh will be ~/gem5/spec.sh

2.	Replace the given se.py with the given se.py
	File location: ~/gem5/configs/example/se.py

3.	Copy the benchmarks.py to the below file location
File location: ~/gem5/configs/example/benchmarks.py

4.	Run the following commands:
a.	cd ~/gem5
b.	chmod +x spec.sh
	
# 10. Testing different protocols in Ruby model
To run Ruby model with different protocols, we have to compile gem5 each time.
1.	To compile gem5
scons build/X86/gem5.opt RUBY=True	PROTOCOL=MESI_Three_Level -j8

Change the PROTOCOL to one of these : MESI_Two_Level, MESI_Three_Level, MOESI_CMP_token, MOESI_CMP_directory to test different protocols

2.	Open spec.sh found in ~/gem5/

3.	The run command will be found at the last line of the spec.sh file. Make changes like changing the l1d_size, l1i_size and so on here before running the shell script.

4.	Use the following command to run the spec.sh  file. Before running the script, make sure you are in the correct directory (~/gem5/)
	./spec.sh <name_of_benchmark> <output_directory>

Eg: ./spec.sh leela /home/aca/gem5/output_dir/

The different benchmarks that can be used are leela, exchange2, imagick, povray and lbm.

5.	The results of the benchmarks will be found in the output directory as stats.txt file. The required data can be got from this file.
	
