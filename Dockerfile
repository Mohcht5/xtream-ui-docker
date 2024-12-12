# استخدم صورة أساسية من Python
FROM python:3.8-slim

# تعيين الدليل العامل في الحاوية
WORKDIR /app

# نسخ الملفات المحلية إلى الحاوية
COPY . /app

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# إضافة ملف install.py
ADD install.py /app/install.py

# تنفيذ السكربت
RUN python /app/install.py

# تحديد المنفذ الذي ستستمع عليه الحاوية
EXPOSE 25500

# الأمر الأساسي لتشغيل التطبيق
CMD ["python", "app.py"]
