clear all; close all; clc;

load('Table4_Jaccard_IOLMaster700_pre.mat')

% Deep Learning - Pre
Mean_Jac_pre_Cornea_DL = mean(Jaccard_IOLMaster700_pre_cornea_DL)
std(Jaccard_IOLMaster700_pre_cornea_DL)

Mean_Jac_pre_Lens_DL = mean(Jaccard_IOLMaster700_pre_lens_DL)
std(Jaccard_IOLMaster700_pre_lens_DL)
clear all; close all; clc;

load('Table4_Jaccard_IOLMaster700_post.mat')

% Deep Learning - Post
Mean_Jac_post_Cornea_DL = mean(Jaccard_IOLMaster700_post_cornea_DL)
std(Jaccard_IOLMaster700_post_cornea_DL)

Mean_Jac_post_IOL_DL = mean(Jaccard_IOLMaster700_post_lens_DL)
std(Jaccard_IOLMaster700_post_lens_DL)
clear all; close all; clc;

load('Table4_Jaccard_ANTERION_pre.mat')

% Classical - Cornea
Mean_Jac_pre_cornea_classical = mean(Jaccard_ANTERION_pre_cornea_classical)
std(Jaccard_ANTERION_pre_cornea_classical)

% Deep Learning - Cornea
Mean_Jac_pre_cornea_DL = mean(Jaccard_ANTERION_pre_cornea_DL)
std(Jaccard_ANTERION_pre_cornea_DL)

% Classical - Lens
Mean_Jac_pre_lens_classical = mean(Jaccard_ANTERION_pre_lens_classical)
std(Jaccard_ANTERION_pre_lens_classical)

% Deep Learning - Lens
Mean_Jac_pre_lens_DL = mean(Jaccard_ANTERION_pre_lens_DL)
std(Jaccard_ANTERION_pre_lens_DL)
