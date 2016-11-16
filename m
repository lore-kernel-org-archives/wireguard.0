Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd030a2b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 09:48:24 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id r204so120461849ywb.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 01:51:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <FE60D347-65AB-49AC-8ECC-8B5DD199DA53@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <CAKXLc7cHjdUZdFfKrq8ynfo24AoD6W8otj2fNqbfnKef5Bm2=w@mail.gmail.com>
 <FE60D347-65AB-49AC-8ECC-8B5DD199DA53@danrl.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Wed, 16 Nov 2016 18:50:52 +0900
Message-ID: <CAKXLc7fFctm__qAQ8N5Vzms_MLFXJe0hf1-A6GH8QMD8B+3zSA@mail.gmail.com>
To: Dan Luedtke <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Nov 16, 2016 at 6:34 PM, Dan Luedtke <mail@danrl.com> wrote:
> Hmm, could it be missing a line like
>
> $(INSTALL_DIR) $(1)/lib/netifd/proto/
>
> In the Makefile? Not sure why we would need to create it, shouldn't it be=
 there?
>
> Kalin, could you try again with the installdir line?
>
Currently the Makefile had this in:

define Package/wireguard-tools/install
    $(INSTALL_DIR) $(1)/usr/bin/
    $(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tools/wg $(1)/usr/bin/
    $(INSTALL_BIN) ./files/wireguard.sh $(1)/lib/netifd/proto/
endef

I patched it:
--- a/srv/OpenWRT/openwrt/feeds/packages/net/wireguard/Makefile
2016-11-16 18:45:57.733060093 +0900
+++ b/srv/OpenWRT/openwrt/feeds/packages/net/wireguard/Makefile
2016-11-16 18:46:07.716948224 +0900
@@ -83,6 +83,7 @@
 define Package/wireguard-tools/install
     $(INSTALL_DIR) $(1)/usr/bin/
     $(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tools/wg $(1)/usr/bin/
+    $(INSTALL_DIR) $(1)/lib/netifd/proto/
     $(INSTALL_BIN) ./files/wireguard.sh $(1)/lib/netifd/proto/
 endef

And it seems to work now. I guess this looks as expected:
./build_dir/target-mips_34kc_musl-1.1.15/WireGuard-experimental-0.0.2016111=
0/ipkg-ar71xx/wireguard-tools/
=E2=94=9C=E2=94=80=E2=94=80 CONTROL
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 postinst
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 prerm
=E2=94=9C=E2=94=80=E2=94=80 lib
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 netifd
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 proto
=E2=94=82           =E2=94=94=E2=94=80=E2=94=80 wireguard.sh
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=94=E2=94=80=E2=94=80 bin
        =E2=94=94=E2=94=80=E2=94=80 wg

(still compiling the rest)

Kalin.
