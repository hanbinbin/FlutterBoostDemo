package com.example.flutter

import android.content.Intent
import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<TextView>(R.id.open_test).setOnClickListener {
            val intent = Intent(this, FlutterContainerActivity::class.java)
            startActivity(intent)
        }
    }
}