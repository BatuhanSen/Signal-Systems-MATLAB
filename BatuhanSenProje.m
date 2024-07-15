%%
[data, fs] = audioread("/MATLAB Drive/Q1.wav");
N = length(data);
t= (0:N-1)/fs;
t1 = (0:fs)

% frekans bileşenlerini hesaplama (genel)
X =fftshift(abs (fft(data)));
f=(-N/2:(N/2)-1)*(fs/N);

% ilk saniyedeki örnekleri saklamak için vektör oluşturma(kadın)
ilk_saniye_ornekleri = data(1:fs);
% ilk saniyedeki frekans bileşenlerini hesaplama
X1 = fftshift(abs(fft(ilk_saniye_ornekleri)));
f1 = (-fs/2:(fs/2)-1)*(fs/fs);


% 0-1 saniye aralığı için örnekleme sayısı
baslangic = 1;
bitis = round(fs);
os1 = bitis - baslangic + 1;
% 0-1 saniye aralığındaki örnekleri saklamak için vektör oluşturma
ornekler_0_1 = data(baslangic:bitis);
t_0_1 = t(baslangic:bitis);


% 1-2 saniye aralığı için yeni örnekleme sayısı (erkek)
baslangic = 1*fs;
bitis = 2*fs;
ornek_sayisi = bitis - baslangic + 1;
% 1-2 saniye aralığındaki örnekleri saklamak için vektör oluşturma
ornekler_1_2 = data(baslangic:bitis);
% 1-2 saniye aralığındaki frekans bileşenlerini hesaplama
X2 = fftshift(abs(fft(ornekler_1_2)));
f2 = (-ornek_sayisi/2:(ornek_sayisi/2)-1)*(fs/ornek_sayisi);


% 1-2 saniye aralığı için örnekleme sayısı
baslangic = fs + 1;
bitis = 2*fs;
os2 = bitis - baslangic + 1;
% 1-2 saniye aralığındaki örnekleri saklamak için vektör oluşturma
ornekler_12 = data(baslangic:bitis);
t_1_2 = t(baslangic:bitis);

figure;
plot (f, X) %genel
figure;
plot (t, data)

figure;
plot (f1, X1) %kadin
figure;
plot(t_0_1, ornekler_0_1)

figure;
plot (f2, X2) %erkek
figure;
plot(t_1_2, ornekler_12)

%% 

[data_2, fs_2] = audioread("/MATLAB Drive/Q2_a.wav");
N = length(data_2);
t= (0:N-1)/fs_2;

% frekans bileşenlerini hesaplama (genel)
X2 =fftshift(abs (fft(data_2)));
f_2=(-N/2:(N/2)-1)*(fs_2/N);

% Düşük geçiren filtre parametreleri
fc = 5000; % Kesim frekansı (Hz)
order = 4; % Filtre düzeni

% Filtre katsayıları hesaplama
[b, a] = butter(order, fc/(fs_2/2), 'low');

% Filtre uygulama
data_filt = filtfilt(b, a, data_2);

% Filtrelenmiş sinyalin frekans bileşenlerini hesaplama
X_filt = fftshift(abs(fft(data_filt)));

% Frekans bileşenleri grafiği
figure;
plot(f_2, X2)
figure;
plot(f_2, X_filt)

sound(data_filt, fs_2)

%%

[data_3, fs_3] = audioread("/MATLAB Drive/Q_2b.wav");
N = length(data_3);
t= (0:N-1)/fs_3;

% frekans bileşenlerini hesaplama (genel)
X3 =fftshift(abs (fft(data_3)));
f_3=(-N/2:(N/2)-1)*(fs_3/N);

% Düşük geçiren filtre parametreleri
fc = 5000; % Kesim frekansı (Hz)
order = 4; % Filtre düzeni

% Filtre katsayıları hesaplama
[b, a] = butter(order, fc/(fs_3/2), 'low');

% Filtre uygulama
data_filt3 = filtfilt(b, a, data_3);

% Filtrelenmiş sinyalin frekans bileşenlerini hesaplama
X_filt3 = fftshift(abs(fft(data_filt3)));

% Frekans bileşenleri grafiği
figure;
plot(f_3, X3)
figure;
plot(f_3, X_filt3)

sound(data_filt3, fs_3)

%%

[data_4, fs_4] = audioread("/MATLAB Drive/Q3.wav");
N = length(data_4);
t4= (0:N-1)/fs_4;

% 350 Hz'den düşük geçiren filtre
fc1 = 350;
order1 = 5;
[b1, a1] = butter(order1, fc1/(fs_4/2), 'low');
data_filt1 = filter(b1, a1, data_4);

% 550-1400 Hz arasındaki bant geçiren filtre
fc2 = [550, 1150];
order2 = 5;
[b2, a2] = butter(order2, fc2/(fs_4/2), 'bandpass');
data_filt2 = filter(b2, a2, data_4);

% 1500-5000 Hz arasındaki bant geçiren filtre
fc3 = [1500, 5000];
order3 = 7;
[b3, a3] = butter(order3, fc3/(fs_4/2), 'bandpass');
data_filt3 = filtfilt(b3, a3, data_4);

% Filtrelenmiş sinyalleri kaydetme
audiowrite('Q3_b.wav', data_filt1, fs_4);
audiowrite('Q3_v.wav', data_filt2, fs_4);
audiowrite('Q3_g.wav', data_filt3, fs_4);



