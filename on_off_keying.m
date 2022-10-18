% %%%%%%%%%%%%%%%%%%%%%%%%
% created by milin zhang
%
% an implementation of on off keying
%
% input: 
%   carrier_freq:  carrier frequency, frequency of the cosine wave
%   bandwidth:     bandwidth of the modulation
%   time_duration: time duration of the whole waveform 
% 
% output:
%   waveform: ideal on-off keying waveform
% %
function waveform = on_off_keying(carrier_freq, bandwidth, time_duration)

    t = 0:1/(carrier_freq*2):(time_duration-1/(carrier_freq*2));
    num_src_bits = time_duration*bandwidth;
    src_bits = randi(2,1,num_src_bits)-1;

    upsamp_factor = carrier_freq*2/bandwidth;
    upsamp = ones(1,upsamp_factor);
    src_bits_us = kron(src_bits,upsamp);

    carrier = cos(2*pi*carrier_freq*t);
    waveform = carrier.*src_bits_us;
    
end