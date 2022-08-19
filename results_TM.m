tomogramListFile='tomograms.vll';
template='average48.em';
mask='mask48.em';
sizeOfChunk=[256,256,256];
coneRange=360;
coneSampling=90;
inPlaneRotationRange=0;
inPlaneRotationSampling=1;
binning=1;
crossCorrelationThreshold=0.38;

JobStorageLocation='/tmp';
NumWorkers=32;
tiltRange=[-50,50];

outputFolder='cs90bin0';
sidelength=48;

pts = dread(outputFolder '.TM/process.mat');
pts.peaks.plotCCPeaks('sidelength',sidelength); % CC values of peaks in ascending order; sidelength specified to examine particle image

