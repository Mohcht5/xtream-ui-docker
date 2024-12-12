# استخدام صورة Ubuntu كأساس
FROM ubuntu:20.04

# تعيين البيئة لتفادي بعض التحذيرات
ENV DEBIAN_FRONTEND=noninteractive

# تحديث الحزم وتثبيت المتطلبات الأساسية
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    curl \
    git \
    mysql-server \
    python3-dev \
    build-essential \
    libssl-dev \
    libmysqlclient-dev \
    sudo \
    unzip \
    lsb-release \
    wget

# تثبيت الأدوات الضرورية مثل curl و wget
RUN apt-get install -y \
    curl \
    wget \
    unzip

# تحميل مستودع Xtream UI من GitHub
RUN git clone https://github.com/Mohcht5/xtream-ui-docker.git /opt/xtreamui

# الانتقال إلى مجلد Xtream UI
WORKDIR /opt/xtreamui

# تثبيت الاعتماديات باستخدام pip
RUN pip3 install -r requirements.txt

# تشغيل السكربت التثبيت
RUN python3 install.py

# فتح المنفذ الذي يستخدمه Xtream UI
EXPOSE 80

# تعيين نقطة دخول الحاوية
CMD ["python3", "start.py"]
