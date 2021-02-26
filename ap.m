% Select image files to be analyzed.
TIFfiles=dir('*.tif'); 
mkdir result;
numfiles=length(TIFfiles);
k=1;
 
while k<=numfiles
 % Reset variables
 close all;
 FN='';
 img='';
 
 FN=TIFfiles(k).name;
 PathName='.\';
 img=imread(FN);
 img=single(img);
 % Conversion of 16-bit image to 8 bit for display
 img8 = uint8(255*(img-min(min(img)))/(max(max(img))-min(min(img))));
 figure(1);
 imshow(img8);

 % Select ROI for calculation of background value
 roi=roipoly;
 background=mean(img(roi));
 img=img-background;
 
 % Select whole cell region to calculate the mean intensity
 figure(2);
 imshow(img8);
 roi2=roipoly;
 
 % Set the threshold as three standard deviation of the mean
 threshold=mean(img(roi2))+3*std(single(img(roi2)));
 
 % Save the mean of whole cell intensity & the sum of fluorescence signals
 % in the selected region
 RESULT_img_mean(k) = mean(img(roi2));
 RESULT_sum_selected(k) = sum(img(img>threshold));
 RESULT_index(k) = (sum(img(img>threshold)))/(mean(img(roi2)));
 
 % Display selected aggregates (pixels with intensities greater than the threshold)
 selected_img=zeros;
 imsize=size(img);
 for x=1:imsize(1)
    for y=1:imsize(2)
        if (img(x,y)>threshold)
            selected_img(x,y)=1;
        else selected_img(x,y)=0;
        end
    end
 end
 figure(3);
 imshow(selected_img);
 
 FN=[PathName, 'result\'];
 FN=[FN, TIFfiles(k).name];
 saveas(gcf, FN, 'tif');
 
 % Exit or Continue
 cont = input('Continue Y/N [Y]: ','s');
 if (cont == 'N')
   k=k-1;
   end
 if (cont == 'n')
   k=k-1;
 end
   k=k+1;
end
 
% Store the results in Excel file
result=[RESULT_sum_selected; RESULT_img_mean; RESULT_index];
xlswrite('result.xls',result);

