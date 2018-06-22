Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b105803
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 17:06:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f555817d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 17:06:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5866aeef
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 17:05:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98548810
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 17:05:39 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id t22-v6so6763207oih.6
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 10:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
 <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
 <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
In-Reply-To: <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jun 2018 19:11:43 +0200
Message-ID: <CAHmME9oQ2x6hHOhcWUkJA=+8XPWUnwa7Oc2xOBeyjaoJ3i8fOQ@mail.gmail.com>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: Jacob Baines <baines.jacob@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jacob,

Thanks for writing in, and for your original blog post. It looks to me
like most people on the mailing list don't know how to use their email
clients, and so you're getting cut off from the responses. However, if
you're interested, they are at least in the archives, starting with
the parent post:
https://lists.zx2c4.com/pipermail/wireguard/2018-June/003032.html

On Fri, Jun 22, 2018 at 3:08 PM Jacob Baines <baines.jacob@gmail.com> wrote=
:
>   My main problem with "--script-security" is that its useless. It just c=
auses OpenVPN to spit a line into a log file (and by that time its too late=
 anyways). That isn't a security mechanism.

Yes, --script-security doesn't solve much at all for this use case,
especially because it can be put inside the config file itself, so
that by the time somebody runs `openvpn --config pwnd.conf`, it's too
late. I think the suggestion in this case would be to add something to
wg-quick(8) along the lines of:

$ wg-quick up --i-recognize-this-config-file-might-murder-kittens pwnd.conf

I don't actually think that helps much though. The users you want to
protect from pwnd.conf will still paste that line verbatim anyway, and
it's just another nob that risks making the whole thing a hassle (like
OpenVPN is with all of those nobs).

>   There also seems to be an expectation that users should understand thes=
e config files. I'm not sure why that is. Excuse my speaking in generalitie=
s but a majority of users aren't going to understand how OpenVPN works, let=
 alone how the configuration file affects the program. Many users (myself i=
ncluded) simply receive config files from our bosses or our IT guy and trus=
t that they aren't malicious. Call me naive or foolish but I don't review e=
very single file passed my way for malicious content.

Yes, that's a very fair assessment of the situation with OpenVPN.
There are a million nobs, and including massive x509 certs inline with
the config makes the whole thing an unscanable mess. I've read the
entire code base of OpenVPN several times and played with nearly every
feature, but I still can't remember off the topic of my head the
semantics of all those nobs. By contrast, a typical wg-quick(8) config
file looks like:

zx2c4@thinkpad ~ $ cat /etc/wireguard/demo.conf
[Interface]
PrivateKey =3D gP+/hJKAhmXKmewrgpkrOKYwvwGwHQ3i5bQqVzWpoEI=3D
Address =3D 192.168.4.207/24
DNS =3D 8.8.8.8, 8.8.4.4, 1.1.1.1, 1.0.0.1

[Peer]
PublicKey =3D JRI8Xc0zKP9kXk8qP84NdUQA04h6DLfFbwJn4g+/PFs=3D
Endpoint =3D demo.wireguard.com:12912
AllowedIPs =3D 0.0.0.0/0

Turns out, though, that our [Interface] section above can also contain
{Post,Pre}{Up,Down}, hence this email thread.

>    Furthermore, I've heard a few times now "config files exec things". Of=
f the top of my head, I can't think of any other applications that execute =
shell commands listed in their configuration file. I have no idea where tha=
t is coming from. Its not a smart practice from a security point of view.

Just going haphazardly through the various random applications on my
laptop, I can think of quite a few actually:

vim
git
mutt
msmtp
chromium
firefox
kde
qtcreator
bash (haha)
portage
systemd
dhcpcd
texstudio
networkmanager
apache
emacs
Most things in /etc/...

I think it's pretty typical for application configuration files on
unix systems to wind up exec'ing things. Configuration is often seen
as a combination of code and data.

On the other hand, there's a set of applications that take purely data
input, and we certainly expect them to not execute anything. This
would apply to things like:

pdf docs
msoffice docs (turing complete!)
jpeg images
text files
sound files
video files
archives

One might conclude from this distinction that configuration files are
not like word files, and therefore should be permitted to execute
things. But if that's the case, is there any real difference between a
configuration file and just shipping around a bash script or elf
binary? Or you could argue that a configuration file is sometimes just
sort of a domain-specific command executor. This is also an
unsatisfying conclusion. So I'm not sure what formal distinction one
should draw in the end, except, "sometimes on unix, it's traditional
and common for configuration files to execute things." Hm.

> I'd try to migrate code into OpenVPN itself or the plugin system

It's worth noting that OpenVPN's configuration file can load
plugins... So... Here's a fun exercise: can you make a polyglot file
that's parsed both as an openvpn configuration file and as an
ELF/PE/Mach-O shared library that the loader will execute code from?
Then you could just specify "plugin /proc/self/fd/3" or the like. Or
there's always the drive-by download trick, where you get a .notadll
file put in the user's download folder for free (and since it isn't a
.dll, it's not handled specially), and then benefit from the fact that
OpenVPN's plugin directive doesn't check file extension. Or, ... okay,
I'll stop now.

Jason
