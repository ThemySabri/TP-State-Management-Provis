from fastapi import FastAPI, HTTPException
from typing import List
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class Properti(BaseModel):
    id: str
    lokasi: str
    kecamatan: str
    tipeHunian: str
    kondisi: str
    luasTanah: str
    luasBangunan: str
    kepemilikan: str
    lebarJalan: str
    jumlahLantai: str
    jumlahKamarTidur: str
    jumlahKamarMandi: str
    garasi: str
    dayaListrik: str
    rooftop: str
    sumberAir: str
    tipeFurnish: str
    harga: str


# Dummy properti data
properti_data = {
    "data": [
        {"id": "1", "lokasi": "Kabupaten Bandung", "kecamatan": "Bojongsoang", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "65", "luasBangunan": "55", "kepemilikan": "SHM", "lebarJalan": "5", "jumlahLantai": "1", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "2", "garasi": "Ada", "dayaListrik": "2200", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "752000000"},
        {"id": "2", "lokasi": "Kabupaten Bandung", "kecamatan": "Cileunyi", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "131", "luasBangunan": "115", "kepemilikan": "SHM", "lebarJalan": "5", "jumlahLantai": "3", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "3", "garasi": "Ada", "dayaListrik": "2200", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "1290000000"},
        {"id": "3", "lokasi": "Kabupaten Bandung", "kecamatan": "Bojongsoang", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "112", "luasBangunan": "127", "kepemilikan": "SHM", "lebarJalan": "5", "jumlahLantai": "2", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "3", "garasi": "Tidak", "dayaListrik": "3500", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "2760000000"},
        {"id": "4", "lokasi": "Jakarta Timur", "kecamatan": "Cakung", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "120", "luasBangunan": "150", "kepemilikan": "SHM", "lebarJalan": "4", "jumlahLantai": "2", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "2", "garasi": "Ada", "dayaListrik": "3500", "rooftop": "Ada", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "3680000000"},
        {"id": "5", "lokasi": "Kota Bekasi", "kecamatan": "Pondok Gede", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "72", "luasBangunan": "45", "kepemilikan": "SHM", "lebarJalan": "5", "jumlahLantai": "1", "jumlahKamarTidur": "2",
         "jumlahKamarMandi": "1", "garasi": "Ada", "dayaListrik": "2200", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "722000000"},
        {"id": "6", "lokasi": "Jakarta Selatan", "kecamatan": "Jagakarsa", "tipeHunian": "Landed House", "kondisi": "Bekas",
         "luasTanah": "80", "luasBangunan": "140", "kepemilikan": "SHM", "lebarJalan": "5", "jumlahLantai": "2", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "3", "garasi": "Ada", "dayaListrik": "3500", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Non Furnished", "harga": "2800000000"},
        {"id": "7", "lokasi": "Kota Bandung", "kecamatan": "Arcamanik", "tipeHunian": "Apartemen", "kondisi": "Baru",
            "luasTanah": "48", "luasBangunan": "48", "kepemilikan": "HGB", "lebarJalan": "5", "jumlahLantai": "1", "jumlahKamarTidur": "2",
         "jumlahKamarMandi": "2", "garasi": "Ada", "dayaListrik": "2200", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Semi Furnished", "harga": "230000000"},
        {"id": "8", "lokasi": "Jakarta Barat", "kecamatan": "Kembangan", "tipeHunian": "Landed House", "kondisi": "Baru",
         "luasTanah": "72", "luasBangunan": "90", "kepemilikan": "SHM", "lebarJalan": "6", "jumlahLantai": "2", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "3", "garasi": "Tidak", "dayaListrik": "4500", "rooftop": "Ada", "sumberAir": "Sumur Bor", "tipeFurnish": "Full Furnished", "harga": "2610000000"},
        {"id": "9", "lokasi": "Kota Bandung", "kecamatan": "Sukasari", "tipeHunian": "Landed House", "kondisi": "Bekas",
         "luasTanah": "150", "luasBangunan": "240", "kepemilikan": "SHM", "lebarJalan": "6", "jumlahLantai": "3", "jumlahKamarTidur": "5",
         "jumlahKamarMandi": "4", "garasi": "Ada", "dayaListrik": "7700", "rooftop": "Tidak", "sumberAir": "PDAM dan Sumur Bor", "tipeFurnish": "Non Furnished", "harga": "7940000000"},
        {"id": "10", "lokasi": "Kabupaten Bandung", "kecamatan": "Padalarang", "tipeHunian": "Apartemen", "kondisi": "Bekas",
         "luasTanah": "98", "luasBangunan": "98", "kepemilikan": "HGB", "lebarJalan": "5", "jumlahLantai": "1", "jumlahKamarTidur": "3",
         "jumlahKamarMandi": "1", "garasi": "Ada", "dayaListrik": "3500", "rooftop": "Tidak", "sumberAir": "PDAM", "tipeFurnish": "Full Furnished", "harga": "700000000"}
    ],
    "message": "success",
    "error": False
}


@app.get("/daftar_properti")
async def get_properti():
    return properti_data


@app.get("/detil_properti/{properti_id}", response_model=Properti)
async def get_properti_detail(properti_id: str):
    for properti in properti_data["data"]:
        if properti["id"] == properti_id:
            return properti
    raise HTTPException(status_code=404, detail="Properti not found")
