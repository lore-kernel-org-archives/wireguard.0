Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 828b1706
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 19:42:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfc4fc2b
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 19:42:43 +0000 (UTC)
Date: Tue, 27 Jun 2017 21:59:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@wut.to
Subject: Re: making wireguard work on RHEL7/etc.
Message-ID: <20170627195904.GA14889@zx2c4.com>
References: <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262144070.17486@bcny.fcbq.bet>
 <20170627110530.GC3026@zx2c4.com>
 <alpine.LRH.2.20.1706271237180.17486@bcny.fcbq.bet>
 <CAHmME9q8+Y_x8fDZ4n-EmU_NB6+vfBttFQ3S58h+B-j-j8e2Kg@mail.gmail.com>
 <alpine.LRH.2.20.1706272042170.17486@bcny.fcbq.bet>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <alpine.LRH.2.20.1706272042170.17486@bcny.fcbq.bet>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jun 27, 2017 at 08:43:30PM +0100, wireguard@wut.to wrote:
> GNU bash, version 4.2.46(1)-release (x86_64-redhat-linux-gnu)

Arg. Looks like namerefs were only added in bash 4.3. Annoying. The
fix looks something like this, but it's so ugly and bothers me:

diff --git a/src/tools/wg-quick.bash b/src/tools/wg-quick.bash
index 6edcd3a..5325f9d 100755
--- a/src/tools/wg-quick.bash
+++ b/src/tools/wg-quick.bash
@@ -54,10 +54,9 @@ parse_options() {
 }
 
 read_bool() {
-	local -n out="$1"
 	case "$2" in
-	true) out=1 ;;
-	false) out=0 ;;
+	true) eval "$1=1" ;;
+	false) eval "$1=0" ;;
 	*) die "\`$2' is neither true nor false"
 	esac
 }


Not sure whether or not I'll merge it yet.
