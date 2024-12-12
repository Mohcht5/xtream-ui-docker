# تحديد الصورة الأساسية
FROM python:3.9

# نسخ كل الملفات من المجلد المحلي إلى الحاوية
COPY . /app

# تحديد المسار للعمل داخل الحاوية
WORKDIR /app

# تثبيت الحزم المطلوبة من ملف requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# إعطاء صلاحية تنفيذ للسكربت install.py
RUN chmod +x /app/install.py

# تنفيذ السكربت install.py
RUN python /app/install.py

# تحديد المنفذ الذي ستستمع عليه الحاوية (إذا كان لديك تطبيق يستمع هنا)
EXPOSE 5000
