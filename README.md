# Trivvo

Trivvo es una app Flutter que actúa como una enciclopedia del cine y las series. Este proyecto utiliza la API de TMDB (The Movie Database) para obtener información actualizada sobre películas, series, actores y más.

---

## 🚀 Comenzando

Sigue estos pasos para configurar el entorno local de desarrollo:

### 1. Clona el repositorio

```bash
git clone https://github.com/tu-usuario/trivvo.git
cd trivvo
```

### 2. Configura tus variables de entorno

Este proyecto utiliza un archivo `.env` para manejar variables sensibles como la API Key de TMDB.

#### 📌 Pasos:

- Duplica el archivo `.env.template` y renómbralo como `.env`:

```bash
cp .env.template .env
```

- Abre el archivo `.env` y agrega tu clave de API de TMDB:

```env
TMDB_API_KEY=tu_clave_de_api_aquí
```

> 🔑 Puedes obtener una clave gratuita registrándote en [TMDB](https://www.themoviedb.org/).

### 3. Instala las dependencias

```bash
flutter pub get
```

### 4. Ejecuta la app

```bash
flutter run
```
