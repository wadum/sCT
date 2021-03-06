startup;

% Load all the images
nii1 = load_nii('coreg/ct.nii');
nii2 = load_nii('coreg/Head_CV_UTE_AC_WIP_719 - 13.nii');
nii3 = load_nii('coreg/Head_CV_UTE_AC_WIP_719 - 14.nii');
nii4 = load_nii('coreg/Head_CV_UTE_AC_WIP_719_18deg - 18.nii');
nii5 = load_nii('coreg/Head_CV_UTE_AC_WIP_719_18deg - 19.nii');
nii6 = load_nii('coreg/Head_t1_mprage_sag_p2_iso - 7.nii');
nii7 = load_nii('coreg/mean_Head_CV_UTE_AC_WIP_719 - 13.nii');
nii8 = load_nii('coreg/mean_Head_CV_UTE_AC_WIP_719 - 14.nii');
nii9 = load_nii('coreg/mean_Head_CV_UTE_AC_WIP_719_18deg - 18.nii');
nii10 = load_nii('coreg/mean_Head_CV_UTE_AC_WIP_719_18deg - 19.nii');
nii11 = load_nii('coreg/mean_Head_t1_mprage_sag_p2_iso - 7.nii');
nii12 = load_nii('coreg/variance_Head_CV_UTE_AC_WIP_719 - 13.nii');
nii13 = load_nii('coreg/variance_Head_CV_UTE_AC_WIP_719 - 14.nii');
nii14 = load_nii('coreg/variance_Head_CV_UTE_AC_WIP_719_18deg - 18.nii');
nii15 = load_nii('coreg/variance_Head_CV_UTE_AC_WIP_719_18deg - 19.nii');
nii16 = load_nii('coreg/variance_Head_t1_mprage_sag_p2_iso - 7.nii');

% Load the mask
mask = load_nii('coreg/mask.nii');

% Pre-allocate list for voxel values
nii_list = zeros(192*192*192, 16);
count = 1;

% Extract the voxel values
for i=1:192,
    for j=1:192,
        for k=1:192,
            if mask.img(i,j,k) == 255,
               nii_list(count, 1) = nii1.img(i,j,k);
               nii_list(count, 2) = nii2.img(i,j,k);
               nii_list(count, 3) = nii3.img(i,j,k);
               nii_list(count, 4) = nii4.img(i,j,k);
               nii_list(count, 5) = nii5.img(i,j,k);
               nii_list(count, 6) = nii6.img(i,j,k);
               nii_list(count, 7) = nii7.img(i,j,k);
               nii_list(count, 8) = nii8.img(i,j,k);
               nii_list(count, 9) = nii9.img(i,j,k);
               nii_list(count, 10) = nii10.img(i,j,k);
               nii_list(count, 11) = nii11.img(i,j,k);
               nii_list(count, 12) = nii12.img(i,j,k);
               nii_list(count, 13) = nii13.img(i,j,k);
               nii_list(count, 14) = nii14.img(i,j,k);
               nii_list(count, 15) = nii15.img(i,j,k);
               nii_list(count, 16) = nii16.img(i,j,k);
               count = count + 1;
            end
        end
    end
end

% Shrink the list to fit the exact number of voxels
nii_list = nii_list(1:count-1, :);

% Uncomment to compute the model
% options = statset('MaxIter',1000,'Display','final');
% GMModel = fitgmdist(nii_list2, 20,'Options',options, 'Regularize',0.01)

%save('GMModel.mat','GMModel');

% Clear local variables
clear i j k count;