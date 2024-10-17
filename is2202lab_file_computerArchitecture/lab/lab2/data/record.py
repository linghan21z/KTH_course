import numpy as np
search_strings = ["gpu_tot_sim_cycle", "gpu_tot_sim_insn", "gpu_tot_ipc", "gpu_tot_occupancy", "L2_BW_total", "gpu_total_sim_rate", "gpgpu_n_mem", "gpgpu_n_mem_per_ctrlr", "gpgpu_dram_buswidth"]
# Define the lists for each metric
gpu_tot_sim_cycle = []
gpu_tot_sim_insn = []
gpu_tot_ipc = []
gpu_tot_occupancy = []
l2_bw_total = []
gpu_total_sim_rate = []

gpgpu_n_mem =[]
gpgpu_n_mem_per_ctrlr = []
gpgpu_dram_buswidth = []

# Function to process each line and append to the corresponding list
def process_line(line):
    key, value = line.split('=')
    key = key.strip().replace(" ", "_").lower()  # Normalize the key format
    value = value.strip()

    # Removing units and converting to appropriate type
    if '%' in value:
        value = float(value.replace('%', ''))
    elif 'GB/Sec' in value:
        value = float(value.replace('GB/Sec', ''))
    else:
        value = float(value)  # Assuming all other values can be converted to float

    # Appending values to corresponding lists
    if key == 'gpu_tot_sim_cycle':
        gpu_tot_sim_cycle.append(value)
    elif key == 'gpu_tot_ipc':
        gpu_tot_ipc.append(value)
    elif key == 'gpu_tot_occupancy':
        gpu_tot_occupancy.append(value)
    elif key == 'gpu_tot_sim_insn':
        gpu_tot_sim_insn.append(value)
    # Add other elif clauses for each metric...
    elif key == 'l2_bw_total':
        l2_bw_total.append(value)
    elif key == 'gpu_total_sim_rate':
        gpu_total_sim_rate.append(value)

    elif key == 'gpgpu_n_mem':
        gpgpu_n_mem.append(value)
    elif key == 'gpgpu_n_mem_per_ctrlr':
        gpgpu_n_mem_per_ctrlr.append(value)
    elif key == 'gpgpu_dram_buswidth':
        gpgpu_dram_buswidth.append(value)
        

# path = input("Model is: ")

# Assuming your file is named 'data.txt'
# with open(path+'stat_64.txt', 'r') as file:
with open('stat_512.txt', 'r') as file:
    for line in file:
        if any(search_string in line for search_string in search_strings):
            if "=" in line and line[0] != '-':
                process_line(line)
                if "=" not in line and line[0] == '-':
                    process_line(line)

# At this point, your lists are filled with data from the file
print("GPU total Simulation Cycles:", sum(gpu_tot_sim_cycle))
print("GPU avg IPC: {:.2f}".format(np.mean(gpu_tot_ipc)))
print("GPU avg occupancy: {:.2f}%".format(np.mean(gpu_tot_occupancy)))
print("GPU total Simulation Instructions:", sum(gpu_tot_sim_insn))
print("GPU avg L2 Bandwidth: {:.2f}".format(np.mean(l2_bw_total)))
print("GPU avg sim rate: {:.2f}".format(np.mean(gpu_total_sim_rate)))

print("gpgpu_n_mem: {:.2f}".format(np.mean(gpgpu_n_mem)))
print("gpgpu_n_mem_per_ctrlr: {:.2f}".format(np.mean(gpgpu_n_mem_per_ctrlr)))
print("gpgpu_dram_buswidth: {:.2f}".format(np.mean(gpgpu_dram_buswidth)))

