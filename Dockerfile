FROM audkar/docker-android-sdk

ENV PATH=$PATH:/opt/flutter/bin

RUN apk update \
    && apk upgrade \
    && apk add --no-cache glu \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

RUN sdkmanager "build-tools;28.0.3" "platforms;android-27" "platforms;android-28" "platform-tools"

#https://flutter.io/docs/development/tools/sdk/archive?tab=linux
RUN FLUTTER_VERSION="v1.0.0" \
    && wget -q https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_"$FLUTTER_VERSION"-stable.tar.xz -O flutter.tar.xz \
    && tar xf flutter.tar.xz -C /opt \
    && rm flutter.tar.xz \
    && chmod -R 777 /opt/flutter

RUN apk add tar
