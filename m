Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f37584d
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Nov 2016 17:59:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a3ef399
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Nov 2016 17:59:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 227701f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Nov 2016 17:59:21 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w33so130044114qtc.3
 for <wireguard@lists.zx2c4.com>; Mon, 28 Nov 2016 10:03:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1566601479887120@web23m.yandex.ru>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 28 Nov 2016 19:03:39 +0100
Message-ID: <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: "qt-creator@qt-project.org" <qt-creator@qt-project.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello All,

Responses to each of you are inline below.

Sounds to me like there's a lot of work to be done, still, and I
haven't received any enthusiastic responses from the Qt team of, "yes!
we'd love to work on this and make Qt Creator suitable for kernel
development!" Bummer. Seems like a great opportunity to increase the
tool's user appeal.

On Wed, Nov 23, 2016 at 8:45 AM, Konstantin Tokarev <annulen@yandex.ru> wro=
te:
> BTW, I'm facing similar issue with QtWebKit: config.h is included into al=
l
> source files, but never in headers, so all #if's in headers are disabled
> and code model does not function properly.

Yep, this is pretty much entirely broken. It's not implemented in the
Qt C++ model, and it straight up does not work in the clang mode
model. The lack of good support for this feature -- project wide
-include file -- is pretty limiting.

On Wed, Nov 23, 2016 at 8:58 AM, Orgad Shaneh <orgads@gmail.com> wrote:
> Which version do you use? Designated initializers support was added in 3.=
2
> (c56b999ffff249d4cb7dc7e8026a3297b63ff56d).
>
> I now see that the members are not detected correctly (for e.g. Find
> Usages), but parsing looks ok.

I'm using 4.1. No, it still does not work. Here's a screenshot:
https://data.zx2c4.com/designated-init-broken-qt-creator-49b6f51f.png

> You can set PRECOMPILED_HEADER =3D header.h in your pro file. It should b=
e
> applied to all sources.

Nope, that's certainly not what that field does.

On Wed, Nov 23, 2016 at 10:21 AM, Eike Ziller <Eike.Ziller@qt.io> wrote:
> Are you using the ClangCodeModel plugin? If not, you probably should.
> It does not help for things like find usages and locator, since for this =
we still use the built-in model,
> and fixes for the built-in model will be very limited.
> But for working with the individual _source_ file it should at least help=
.
> I can even open Objective-C++ files and get decent highlighting and even
> get some completion for Objective-C ;)

The clang mode model is even more buggy than the built-in one. Not
only that, but it's an order of magnitude slower too, which makes Qt
Creator impossible to use. The only viable usage of the IDE is through
the built-in code model. Hopefully the Qt engineers will put in the
time to bring it up to par with modern times with -include, and add
explicit C support...

> One other issue are header files - there is no way Qt Creator can automat=
ically tell if a
> .h file is supposed to be C, C++, Objective-C, Objective-C++, ....
> One hack workaround for C might be to remove *.h from the text/x-c++hdr m=
ime type in Options > Environment > Mime Types,
> but that would be a big and global hack (if it worked) ;)
> We could probably provide a project setting for a =E2=80=9Cdefault=E2=80=
=9D language to use though, which would then also be sharable with all in t=
he project sources with a .shared file.

A project-wide setting would indeed be most welcome for this.


On Wed, Nov 23, 2016 at 5:15 PM, Andrzej Telszewski
<atelszewski@gmail.com> wrote:
> I don't remember exactly, but I used some other feature of QtC (Import
> Project was it?).
> It allowed to easily setup QtC for kernel development.
> It worked pretty well, most of the time.
> Just a quick search:
> http://stackoverflow.com/questions/5417732/howto-prepare-qtcreator-for-li=
nux-driver-kernel-development

The solution listed here is basically wrong and doesn't work. The code
model won't actually parse that #include properly.

>
> I too remember seeing false errors when code model parsed struct members
> initializers.
>
> But this code seems to work just fine now:

Try something slightly more complicated and it totally blows up again.
See the linked screenshot above.

> And yes, although I'm not going to be involved in enhancing QtC, I would
> love to see C receiving decent support.
> QtC is my main (well, the only) IDE, and I write both C and C++ code.

If only the Qt developers cared about this too. Missed opportunity IMHO.

Jason
