% Set the paths to the input and output folders
input_folder = 'C:\Users\hp\OneDrive\Desktop\messidor_dataset\Base11_code_rearrangement\1';
output_folder = 'C:\Users\hp\OneDrive\Desktop\messidor_dataset\Base11_code_rearrangement\gp1';

% Get the list of medical images in the input folder
images = dir(fullfile(input_folder, '*.tif'));

% Loop over each image and perform the augmentations
for i = 1:length(images)
    % Load the current image
    I = imread(fullfile(input_folder, images(i).name));
    
    % Perform the horizontal flipping augmentation
    I_flip_horz = fliplr(I); % Flip the image horizontally
    
    % Save the horizontally flipped image to the output folder
    output_filename = sprintf('horz_flipped_%d.tif', i);
    imwrite(I_flip_horz, fullfile(output_folder, output_filename));
    
    % Perform the vertical flipping augmentation
    I_flip_vert = flipud(I); % Flip the image vertically
    
    % Save the vertically flipped image to the output folder
    output_filename = sprintf('vert_flipped_%d.tif', i);
    imwrite(I_flip_vert, fullfile(output_folder, output_filename));
    
    % Perform the rotating augmentation
    angle = randi([-30, 30]); % Generate a random rotation angle
    I_rot = imrotate(I, angle, 'crop'); % Rotate the image by the random angle
    
    % Save the rotated image to the output folder
    output_filename = sprintf('rotated_%d.tif', i);
    imwrite(I_rot, fullfile(output_folder, output_filename));
end
