import 'package:fedemas_app/screens/project_details_screen.dart';
import 'package:flutter/material.dart';

class Home2WorkProjectScreen extends ProjectDetailsScreen {
  static const String ROUTE = "/project/home2work/";

  String getTitle() => 'Home2Work';
  String getSubtitle() => 'A car pooling app';

  Widget getBody() {
    return Container(
      height: 2000,
      child: Text(
        '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque metus vel semper tempus. Cras pharetra augue non facilisis hendrerit. Aliquam in dictum justo, sed suscipit dui. Maecenas pretium diam non tellus viverra ultricies. Duis quis dignissim lectus. Nulla varius dolor commodo tortor bibendum efficitur. Phasellus dictum lorem ut blandit fringilla. Sed facilisis est sed convallis sagittis. Nulla sodales tortor vel tortor facilisis tincidunt. Pellentesque tellus tellus, lobortis non enim lacinia, vestibulum facilisis lorem. Fusce porttitor sollicitudin ligula in eleifend. Nam aliquam purus in sapien maximus, non suscipit libero lobortis. Morbi suscipit risus eget ante pulvinar mollis. Vestibulum hendrerit, mi id auctor auctor, nibh dolor pharetra lorem, at varius eros dui non magna. Vestibulum quis tempus elit. Pellentesque ut odio nec eros condimentum pretium.

Vestibulum placerat ac ex nec elementum. Maecenas eget arcu quis tortor ultricies auctor. Curabitur rhoncus, mauris sit amet maximus ornare, justo mauris eleifend sem, quis pharetra nisl libero et risus. Proin commodo nibh sem, quis tristique mi varius id. Integer tortor magna, congue dictum molestie vel, scelerisque in eros. Mauris arcu nisi, faucibus lobortis faucibus nec, porta quis tellus. Suspendisse fermentum orci at tellus pretium, et imperdiet tellus laoreet. Nullam rutrum nulla id sem finibus maximus. Quisque ut tortor egestas nulla varius ultricies a ac metus. Nunc porta dictum est id imperdiet. Donec vehicula quis libero non ornare.

Ut nunc eros, sollicitudin quis ligula ac, facilisis maximus tortor. Quisque viverra tellus eu sollicitudin tincidunt. Nullam efficitur tellus eget mi imperdiet gravida. Curabitur nulla nisi, efficitur id turpis ut, pretium dapibus ante. Curabitur vitae magna egestas, consectetur urna vel, tristique enim. Duis vitae nisl eu mauris posuere interdum. Nullam commodo ipsum ornare leo aliquet, ut efficitur leo fermentum. Pellentesque et consectetur libero. Duis quis euismod tortor. Donec tempus hendrerit quam. Nam tincidunt consequat mollis.

Nullam risus ante, pretium eu tristique vitae, euismod a tortor. Vestibulum elementum tincidunt eros, non efficitur nibh convallis nec. Curabitur neque enim, suscipit sit amet condimentum sed, viverra eget enim. Etiam ut tincidunt odio. Etiam in scelerisque mi. Etiam interdum, velit vel aliquam suscipit, velit metus feugiat dui, eu fringilla metus justo a leo. Fusce libero lorem, vulputate tincidunt nibh sit amet, pretium volutpat nibh. Curabitur viverra, leo ut volutpat laoreet, ante enim rhoncus justo, a posuere urna metus ac velit. Cras mattis venenatis tempor.

Nulla gravida, mi at eleifend tincidunt, dolor nulla mattis est, ac hendrerit neque augue vestibulum lorem. Nullam aliquet magna nec lacinia finibus. Maecenas consequat purus risus, non fringilla sapien pellentesque nec. Phasellus nec turpis dictum lectus euismod aliquam nec et sem. Cras sit amet malesuada enim. Duis cursus lorem id nunc dictum bibendum. Suspendisse odio purus, auctor at metus eget, scelerisque accumsan ante. Sed rutrum mollis velit, nec vestibulum justo tempor nec. Duis ullamcorper ex rhoncus nulla mollis vulputate.
      
      ''',
        style: paragraphStyle,
      ),
    );
  }
}
