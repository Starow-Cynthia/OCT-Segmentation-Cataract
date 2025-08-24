clc;
clear;

% --- Load Data ---
load('Table6_IOLMaster700_pre.mat');   % Pre-surgery
age_pre = age; RAC_pre = RAC_OCT; RPC_pre = RPC_OCT; CT_pre = CT_OCT;
ACD_pre = ACD_OCT; LT_pre = LT_OCT; RAL_pre = RAL_OCT; RPL_pre = RPL_OCT;

load('Table6_IOLMaster700_post.mat');  % Post-surgery
age_post = age; RAC_post = RAC_OCT; RPC_post = RPC_OCT; CT_post = CT_OCT;
ACD_post = ACD_OCT; LT_post = LT_OCT; RAL_post = RAL_OCT; RPL_post = RPL_OCT;

% --- Feature Names ---
features = {'Age', 'RAC_OCT', 'RPC_OCT', 'CT_OCT', ...
            'ACD_OCT', 'LT_OCT', 'RAL_OCT', 'RPL_OCT'};

% --- Pre and Post Feature Arrays ---
pre_data = {age_pre, RAC_pre, RPC_pre, CT_pre, ...
            ACD_pre, LT_pre, RAL_pre, RPL_pre};

post_data = {age_post, RAC_post, RPC_post, CT_post, ...
             ACD_post, LT_post, RAL_post, RPL_post};

% --- Initialize Results ---
pre_mean = zeros(length(features),1);
pre_std = zeros(length(features),1);
post_mean = zeros(length(features),1);
post_std = zeros(length(features),1);
p_values = zeros(length(features),1);

% --- Calculate Mean, Std, p-values ---
for i = 1:length(features)
    x = pre_data{i};
    y = post_data{i};

    % Ensure same length, handle missing NaNs
    valid = ~isnan(x) & ~isnan(y);
    x = x(valid); y = y(valid);

    pre_mean(i) = mean(x);
    pre_std(i) = std(x);
    post_mean(i) = mean(y);
    post_std(i) = std(y);

    [~, p_values(i)] = ttest(x, y);  % Paired t-test
end

% --- Create Table ---
T = table(features', ...
          round(pre_mean,4), round(pre_std,4), ...
          round(post_mean,4), round(post_std,4), ...
          round(p_values,4), ...
          'VariableNames', {'Feature', 'Pre_Mean', 'Pre_SD', 'Post_Mean', 'Post_SD', 'p_Value'});

% --- Display Table ---
disp('=== Table 6: IOLMaster700 Biometric Comparison (Pre vs Post) ===');
disp(T);

% --- Save to Excel ---
writetable(T, 'Table6_IOLMaster700_Comparison.xlsx');
