# Elliptical progress bar 

**Features**
* Responsive
* Customizable
* Easy styling

## Installing
`flutter get elliptical_progress_bar`

## Important
The aspect ratio of the graph is 3:1, adjust thickness required accordingly.

## Usage
```
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Elliptical progress bar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: 
                EllipticalProgressBar(
                  fillColor: Colors.red,
                  bgColor: Colors.red.withOpacity(0.5),
                  thickness: 30,
                  progress: 70,
                  textColor: Colors.blue,
                  showCenterProgress: false,
                ),
            ),
          ),
        );
  }
}
```

## Props
| Name              | Value                                                               | Description                                                                                       |
|-------------------| ------------------------------------------------------------------  | -------------------------------------------------------------------------------------------------------------------------------------------     |
| fillColor      | Color  | Color to show the progress with.    |
|  bgColor         | Color | Color to show the loop with.  |
| progress          | double | Progress value (0 - 100).  |
| textColor         | Color, optional | Color to show the progress text in center with.  |
|showCenterProgress           | bool, default - true, optional  | enable to show the center progress value, set to false to hide |
|thickness| double, default - 10, optional | set the thickness of the loop |
| progressTextStyle          | TextStyle, optional  | To customise the center progress text style|
