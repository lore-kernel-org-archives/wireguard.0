Return-Path: me.kalin@gmail.com
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b80e9a8
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 18:16:13 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id d59so45604744ybi.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 10:19:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
 <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
 <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 17 Nov 2016 03:18:43 +0900
Message-ID: <CAKXLc7fmasvJFcmg5gjgWhA9pyjP9YUh6O6DqyTwU4nxvk1XJQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/mixed; boundary=94eb2c092fa09951d105416f1be7
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] RFE: A notion of VERSION (was: Debugging AllowedIps)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c092fa09951d105416f1be7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 2:40 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
> Trying again with no line breaks:
>
>> WIREGUARD_VERSION :=3D $(shell parent_name=3D$$(readlink -f .. | sed -n =
's:.*/[wW]ire[Gg]uard[a-z-]*-\([0-9.]\+\)$$:\1:p');  if [ -d ../.git ]; the=
n echo "git-$$(git rev-parse --short HEAD)"; elif [ -n $parent_name ]; then=
 echo "$$parent_name"; else echo "unknown"; fi)
>

I couldn't make it work as meant to, fails (=3Dprints empty string) when
I rename .git to .git- for example.

Here is it on 2 lines.

--94eb2c092fa09951d105416f1be7
Content-Type: application/octet-stream; name=Makefile
Content-Disposition: attachment; filename=Makefile
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ivl93s4f0

cGFyZW50X25hbWUgOj0gJChyZWFkbGluayAtZiAuLiB8IHNlZCAtbiAnczouKi9bd1ddaXJlW0dn
XXVhcmRbYS16LV0qLVwoWzAtOS5dXCtcKSQkOlwxOnAnKQpXSVJFR1VBUkRfVkVSU0lPTiA6PSAk
KHNoZWxsIGlmIFsgLWQgLi4vLmdpdCBdOyB0aGVuIGVjaG8gImdpdC0kJChnaXQgcmV2LXBhcnNl
IC0tc2hvcnQgSEVBRCkiOyBlbGlmIFsgIngkKHBhcmVudF9uYW1lKSIgPT0gIngiIF07IHRoZW4g
ZWNobyAiJChwYXJlbnRfbmFtZSkiOyBlbHNlIGVjaG8gInVua25vd24iOyBmaSkKCnZlcnNpb246
CglAZWNobyAkKFdJUkVHVUFSRF9WRVJTSU9OKQo=
--94eb2c092fa09951d105416f1be7--
