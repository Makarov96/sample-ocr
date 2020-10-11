package com.example.randomimages

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

import android.widget.ImageView
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.squareup.picasso.Picasso


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        var imagePhoto: ImageView = findViewById(R.id.imagePhoto)
        var imagePhoto2: ImageView = findViewById(R.id.imagePhoto2)
        var btnGetUrlImage: Button = findViewById(R.id.btnGetUrlImage)

        var model = ViewModelProvider(this).get(MainActivityViewModel::class.java)

        var urlImage: MutableLiveData<String?>? = model.callURlImage()

        urlImage?.observe(this, Observer {
            print("Se jecuta si la url sufre algun cambio")
            Picasso.get().load(it).into(imagePhoto)
            Picasso.get().load(it).into(imagePhoto2)

        })

        btnGetUrlImage.setOnClickListener{
            model.randomNumbersUrl()
        }

    }
}