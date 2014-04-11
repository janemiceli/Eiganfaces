%File MyEigenface.m
%Author MaryJane Miceli
%Math for code http://www.cim.mcgill.ca/~wsun/sa/project/node10.html
%calculating EigenFaces
aveFace=imread('training images\faces\aveFace.jpg');
blank=aveFace;
img1=imread('training images\faces\1.jpg');
img2=imread('training images\faces\2.jpg');
img3=imread('training images\faces\3.jpg');
img4=imread('training images\faces\4.jpg');
img5=imread('training images\faces\5.jpg');
img6=imread('training images\faces\6.jpg');
img7=imread('training images\faces\7.jpg');
img8=imread('training images\faces\8.jpg');
img9=imread('training images\faces\9.jpg');
img10=imread('training images\faces\10.jpg');
img11=imread('training images\faces\11.jpg');
img12=imread('training images\faces\12.jpg');
img13=imread('training images\faces\13.jpg');
img14=imread('training images\faces\14.jpg');
img15=imread('training images\faces\15.jpg');
img16=imread('training images\faces\16.jpg');
img17=imread('training images\faces\17.jpg');
img18=imread('training images\faces\18.jpg');
img19=imread('training images\faces\19.jpg');
img20=imread('training images\faces\20.jpg');
%I = imread('coins.png');
%level = graythresh(I);
%BW = im2bw(I,level);
%imshow(BW)
%level1 = graythresh(img1c)%
%level2 = graythresh(img2c)
%level3 = graythresh(img3c)
%level4 = graythresh(img4c)
%level5 = graythresh(img5c)
%level6 = graythresh(img6c)
%level7 = graythresh(img7c)
%level8 = graythresh(img8c)
%level9 = graythresh(img9c)
%level10 = graythresh(img10c)
%level11 = graythresh(img11c)
%level12 = graythresh(img12c)
%level13 = graythresh(img13c)
%level14 = graythresh(img14c)
%level15 = graythresh(img15c)
%%level16 = graythresh(img16c)
%level17 = graythresh(img17c)
%level18 = graythresh(img18c)
%level19 = graythresh(img19c)
%level20 = graythresh(img20c)
%%img1 = im2bw(img1c, level1)
%%img2 = im2bw(img2c, level2)
%img3 = im2bw(img3c, level3)
%img4 = im2bw(img4c, level4)
%img5 = im2bw(img5c, level5)
%img6 = im2bw(img6c, level6)
%img7 = im2bw(img7c, level7)
%img8 = im2bw(img8c, level8)
%img9 = im2bw(img9c, level9)
%%img10 = im2bw(img10c, level10)
%img11 = im2bw(img11c, level11)
%img12 = im2bw(img12c, level12)
%img13 = im2bw(img13c, level13)
%img14 = im2bw(img14c, level14)
%img15 = im2bw(img15c, level15)
%img16 = im2bw(img16c, level16)
%img17 = im2bw(img17c, level17)
%img18 = im2bw(img18c, level18)
%img19 = im2bw(img19c, level19)
%img20 = im2bw(img20c, level20)
%figure(1);
%subplot(2,2,1);imagesc(img2c);title('color'); 
%subplot(2,2,2);imagesc(img2);title('black and white');
%imgVector=[img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20];
%% calculate the averages of the faces
%sumFace1 = imadd(img1, img2);
%sumFace2 = imadd(img3, img4);
%sumFace3 = imadd(img6, img7); 
%sumFace4 = imadd(img8, img9);
%SumFace5 = imadd(img11, img12);
%sumFace6 = imadd(img13, img14);
%SumFace7 = imadd(img16, img17);
%sumFace8 = imadd(img18, img19);
%sumFace9 = imadd(img5, img10);
%sumFace10 = imadd(img15, img20);
%SumFacsa = imadd(sumFace1, sumFace2);
%sumFaceb = imadd(sumFace3, sumFace4);
%SumFacsc = imadd(sumFace5, sumFace6);
%sumFaced = imadd(sumFace7, sumFace8);
%SumFacse = imadd(sumFace9, sumFace10);
%sumFacef = imadd(sumFacea, sumFaceb);
%sumFaceg = imadd(sumFacec, sumFaced);
%SumFaceh = imadd(sumFacee, sumFacef);
%SumFacei = imadd(sumFaceg, sumFaceh);
%aveFace = imdivide(SumFacei,20);
imgVector=[img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20];
%aveFace=sum(imgVector);
%aveFace=imdivid(aveFace)/20
aveFace=imlincomb(.05,img1,.05,img2,.05,img3,.05,img4,.05,img5,.05,img6,.05,img7,.05,img8,.05,img9,.05,img10,.05,img11,.05,img12,.05,img13,.05,img14,.05,img15,.05,img16,.05,img17,.05,img18,.05,img19,.05,img20); 
imshow(aveFace);
imwrite(aveFace, 'training images\faces\aveFace.jpg', 'Quality', 100);
vectorAveTemp=[aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace aveFace];

% calculate the difference of each face from the average
diffVector=imgVector-vectorAveTemp;

% create a covariance matrix
diffVectorT=diffVector';
C=diffVector*diffVectorT(5120:5120);

% find eigenvectors
L=diffVectorT*diffVector(5120:5120);

% the eignenvectors u, of the matrix c are expressed by a linear
% combination of the difference face images diffVector[] weighted by v
U=L*diffVector(5120:5120);
u_matrix=U;
% Now for face detection using eigenfaces
% math used for this section from
% http://www.cim.mcgill.ca/~wsun/sa/project/node11.html
Omega=U'*diffVector(5120:5120);

half=.5;
maxtemp = blank;
temp1 = blank;
extra= blank;
for j=1:20
   for k=1:20 
        temp=abs(Omega(j)-Omega(k));
        if temp1 > maxtemp 
            maxtemp=temp1;
        end
   end
end

j=0;
k=0;
largestvariance=half*maxtemp;

% time to get a new image
%newimg1=imread('training images\faces\DSC00026.JPG');
newimage=imread('training images\faces\tim.JPG');

UT=U';
newimagearray=[newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage newimage];
%tempOmega=imgVector
new_Omega=newimagearray.*UT-vectorAveTemp;
%subtract aveFace
%for m = 1:20
%    newOmega(m)=(tempOmega(m)-aveFace)
%end
%eksquared = [blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank blank]
eksquaredtemp=new_Omega - Omega;
eksquared=eksquaredtemp.*eksquaredtemp;
               
%escalarsquaredtemp=newimage-(U*newOmega(5120:5120)+aveFace)
thisshouldbe256256=blank;
%thisshouldbe256256=new_Omega .* u_matrix'; % error, this should return a 256 by 256 matrix
for x =1:1
    for z = 1:1
        for y = 1:20
            thisshouldbe256256(x,z)=thisshouldbe256256(x,z)+new_Omega(y, z)*u_matrix(x, y);
        end
    end
end

escalarsquaredtemp1=thisshouldbe256256+aveFace;
escalarsquaredtemp2=newimage-escalarsquaredtemp1;
escalarsquared=escalarsquaredtemp2.*escalarsquaredtemp2;


doubledscalar=double(escalarsquared)+1;
doubledlargestvariance=double(largestvariance);
escalar=sqrtm(doubledscalar);
%tempescalar=uint8(escalar)-1;

if escalar>=doubledlargestvariance
    face='Is not a face';
else
    face='Face Detected!!!';
end



figure(2);
subplot(2,2,1);imagesc(aveFace);title('average face from test images'); 
subplot(2,2,2);imagesc(newimage);title(face);

    
