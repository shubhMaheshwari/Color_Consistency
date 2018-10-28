clc;
close all;
clear;
dirname = 'panorama1\';
files = dir(strcat(dirname,'*.??g'));
ct = 0;
for file = files'
    ct = ct+1;
    im_set{ct} = imread(strcat(dirname,file.name));
end

W = zeros(ct,ct);

adj_mat = zeros(ct,ct);
for i=2:ct
    [M,w,TT] = Affinity(im_set{i},im_set{i-1});
    W(i,i-1) = sum(sum(w));
    disp(W(i,i-1));
end

im_res{1} = im_set{1};
for i=2:ct
    if W(i,i-1)~=0
        im_res{i} = CalAns(im_set{i},im_res{i-1});
    end
end

im_res{1} = im2double(im_set{1});
for i=1:ct
    im_res{i} = (im_res{i} - min(min(min(im_res{i}))))/(max(max(max(im_res{i})))-min(min(min(im_res{i}))));
end

for i=1:ct
   imwrite(im_res{i},sprintf('output1/paper-%02d.jpg',i));
end