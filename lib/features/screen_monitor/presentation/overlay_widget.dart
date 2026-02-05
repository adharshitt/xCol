class AIAlertOverlay extends StatelessWidget {

  const AIAlertOverlay({super.key});

  @override

  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.red.withOpacity(0.8),

        borderRadius: BorderRadius.circular(20),

      ),

      child: Row(

        mainAxisSize: MainAxisSize.min,

        children: const [

          Icon(Icons.warning, color: Colors.white),

          SizedBox(width: 8),

          Text("AI CONTENT DETECTED", style: TextStyle(color: Colors.white)),

        ],

      ),

    );

  }

}

