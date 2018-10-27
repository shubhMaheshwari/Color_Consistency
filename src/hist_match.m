source = im2double(imread('l1.jpg'));
ref = im2double(imread('l2.jpg'));

h_source = rgb2hsv(source);
h_ref = rgb2hsv(ref);

final = h_source;
final(:,:,1) = imhistmatch(h_source(:,:,1), h_ref(:,:,1));
final(:,:,2) = imhistmatch(h_source(:,:,2), h_ref(:,:,2));
final(:,:,3) = imhistmatch(h_source(:,:,3), h_ref(:,:,3));

final = hsv2rgb(final);
imwrite(final, 'fhsv.jpg');
figure;imshow(final);

figure;
final2 = source;
final2(:,:,1) = imhistmatch(source(:,:,1), ref(:,:,1));
final2(:,:,2) = imhistmatch(source(:,:,2), ref(:,:,2));
final2(:,:,3) = imhistmatch(source(:,:,3), ref(:,:,3));
imshow(final2);
imwrite(final2, 'frgb.jpg');