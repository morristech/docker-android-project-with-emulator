FROM gfx2015/android

MAINTAINER FUJI Goro <g.psy.va+github@gmail.com>

ENV COMPONENTS sys-img-armeabi-v7a-addon-google_apis-google-23,addon-google_apis-google-23
ENV AVD test

COPY wait-for-emulator /usr/local/bin/wait-for-emulator
COPY start-emulator /usr/local/bin/start-emulator

RUN echo yes | android update sdk --all --no-ui --filter "$COMPONENTS" && \
    echo no | android create avd --force -n "$AVD" -t android-23

CMD start-emulator
