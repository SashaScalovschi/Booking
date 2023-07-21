class RoomPhotoImageUploader < CarrierWave::Uploader::Base
  # Включаємо підтримку зберігання файлів на локальному сервері
  storage :file

  # Директорія для завантажених зображень кімнат
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Встановлення розміру зображення для версії :medium
  process resize_to_fit: [800, 800]

  # Дозволені типи файлів зображень
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # Генерування унікального імені для завантаженого зображення
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  # Генерування унікального токену для імені файлу
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end