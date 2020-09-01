FROM audkar/docker-android-sdk

ENV PATH=$PATH:/opt/flutter/bin

RUN apk update \
    && apk upgrade \
    && apk add --no-cache glu tar xz bash git \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

RUN sdkmanager "build-tools;29.0.3" "platforms;android-29" "platform-tools"

#https://flutter.io/docs/development/tools/sdk/archive?tab=linux
RUN FLUTTER_VERSION="1.20.2" \
    && wget -q https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_"$FLUTTER_VERSION"-stable.tar.xz -O flutter.tar.xz \
    && tar xf flutter.tar.xz -C /opt \
    && rm flutter.tar.xz \
    && chmod -R 777 /opt/flutter \
    && yes | flutter doctor --android-licenses
