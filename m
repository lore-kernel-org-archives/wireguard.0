Return-Path: cloos@jhcloos.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc4da64a
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 14:34:57 +0000 (UTC)
Received: from ore.jhcloos.com (ore.jhcloos.com [IPv6:2604:2880::b24d:a297])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa322ce4
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 14:34:57 +0000 (UTC)
From: James Cloos <cloos@jhcloos.com>
To: wireguard@lists.zx2c4.com
Subject: wireguard-go compilation fails
Date: Mon, 13 Aug 2018 10:46:34 -0400
Message-ID: <m31sb2qq7p.fsf@carbon.jhcloos.org>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

make update-deps shows the error:

:; make update-dep
rm -rf .gopath
mkdir -p .gopath/src/git.zx2c4.com/
ln -s ../../.. .gopath/src/git.zx2c4.com/wireguard-go
touch .gopath/.created
command -v dep >/dev/null || go get -v github.com/golang/dep/cmd/dep

...

Fetching https://gopkg.in/yaml.v2?go-get=1
Parsing meta tags from https://gopkg.in/yaml.v2?go-get=1 (status code 200)
get "gopkg.in/yaml.v2": found meta tag main.metaImport{Prefix:"gopkg.in/yaml.v2", VCS:"git", RepoRoot:"https://gopkg.in/yaml.v2"} at https://gopkg.in/yaml.v2?go-get=1
gopkg.in/yaml.v2 (download)
Makefile:48: recipe for target 'update-dep' failed
make: *** [update-dep] Error 1


Using apt to install golang-goyaml-dev did not get past that error.

I'd like to use wg on some virtuals which do not support modules, mainly
to encrypt some udp traffic.

Subsequent runs of make fail differently:

:; make
command -v dep >/dev/null || go get -v github.com/golang/dep/cmd/dep
import "context": import path doesn't contain a slash
package context: unrecognized import path "context"
Makefile:34: recipe for target 'vendor/.created' failed
make: *** [vendor/.created] Error 1


-JimC
-- 
James Cloos <cloos@jhcloos.com>         OpenPGP: 0x997A9F17ED7DAEA6
