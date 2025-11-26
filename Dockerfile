# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-impact-subpack@1.3.5
RUN comfy node install --exit-on-fail comfyui-kjnodes
RUN comfy node install --exit-on-fail was-node-suite-comfyui
RUN comfy node install --exit-on-fail comfyui_controlnet_aux
RUN comfy node install --exit-on-fail comfyui-advanced-controlnet
RUN comfy node install --exit-on-fail comfy-mtb
RUN comfy node install --exit-on-fail comfyui_essentials
RUN comfy node install --exit-on-fail comfyui-custom-scripts
RUN comfy node install --exit-on-fail Comfyui-EasyIllustrious
RUN comfy node install --exit-on-fail comfy-image-saver
RUN comfy node install --exit-on-fail ComfyLiterals
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.28.0
RUN comfy node install --exit-on-fail comfyui_ultimatesdupscale@1.6.0
RUN comfy node install --exit-on-fail rgthree-comfy
RUN comfy node install --exit-on-fail comfyui-easy-use

RUN wget -O /comfyui/models/ultralytics/bbox/Eyeful_v2-Paired.pt \
    https://huggingface.co/GritTin/LoraStableDiffusion/resolve/c7766cc3c9b8b4f914932ce27f1cd48f25434636/Eyeful_v2-Paired.pt

RUN comfy node install --exit-on-fail comfyui-fluxtrainer@1.0.2

COPY input/ /comfyui/input/
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml