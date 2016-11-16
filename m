Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4fa5970
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 00:31:39 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
Date: Wed, 16 Nov 2016 01:34:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------67254D273F5FFD6A6BD0A2B9"
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------67254D273F5FFD6A6BD0A2B9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 2016-11-16 01:12, Jason A. Donenfeld wrote:
> Hey Egbert,
>
> Great to see! How much does this deviate from debian's? As far as I
> can tell, you should be able to keep things basically the same.
I just copyed the debian folder of the experimental package of the
debian repo.
Left all the copyrights intact and added my name.
> This isn't okay. Downstream packages really shouldn't be applying
> patches like that. If you revert that, I can list this as the primary
> PPA for WireGuard. With that said, let's actually try to fix this
> issue for good...
Can't agree more, but I wanted to test it and deploy it with ansible,
that was the simplest solution.
> AVX2 is advertised through CPUID. Is it possible that your VPS passes
> through the CPUID from the host while not supporting all instructions?
> Or perhaps, rather, fakes a CPUID that isn't the host's, while only
> supporting instructions of the host? Very mysterious. What hosting
> company is this? Is there a chance I can poke around at this setup? Do
> you know if it's KVM or Xen or VMWare or something else?
It is hosted at PCexterme, dutch company. Cheap and good service. The
use KVM with CloudStack on top of it.
I mailed/called with one of the sys admins and discussed with him about
the problem in the AVX2 extention.
He told me that they disabled AVX already because of the raid 6 system.
It crashes the whole KVM host.

Can give you a vps if you want to. Just 3 euro the month.
> If it turns out that your VPS host just does something horrible, I'll
> look for a way to globally disable kernel usage of AVX2, without
> having to patch WireGuard like that.
If I can found the kernel parmameter for that, I will.
> If it's particular to the host,
> perhaps we can come up with either a particular kernel module to do
> the disabling, or some ungodly hack to /dev/kmem...
You are going above my intellect of the kernel at this point.
>  Are you compiling
> your own kernel for this system, or just using stock Ubuntu kernel?
No not yet. I was planning on this email to tell your my ppa / kernel
problem.
> I'm pretty sure, by the way, that we're using the right detection
> function within WireGuard, seeing as every other place in the tree
> uses the same thing: 		
* lib/raid6/avx2.c
* 36:     return boot_cpu_has(X86_FEATURE_AVX2) &&
boot_cpu_has(X86_FEATURE_AVX);
I think I'm going to mail/call the hosting company again.
> Thanks a bunch for helping out.
You to with this great this VPN.
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard


--------------67254D273F5FFD6A6BD0A2B9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 2016-11-16 01:12, Jason A. Donenfeld wrote:<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">Hey Egbert,

Great to see! How much does this deviate from debian's? As far as I
can tell, you should be able to keep things basically the same.
</pre>
    </blockquote>
    I just copyed the debian folder of the experimental package of the
    debian repo.<br>
    Left all the copyrights intact and added my name.
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">This isn't okay. Downstream packages really shouldn't be applying
patches like that. If you revert that, I can list this as the primary
PPA for WireGuard. With that said, let's actually try to fix this
issue for good...</pre>
    </blockquote>
    Can't agree more, but I wanted to test it and deploy it with
    ansible, that was the simplest solution.
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">AVX2 is advertised through CPUID. Is it possible that your VPS passes
through the CPUID from the host while not supporting all instructions?
Or perhaps, rather, fakes a CPUID that isn't the host's, while only
supporting instructions of the host? Very mysterious. What hosting
company is this? Is there a chance I can poke around at this setup? Do
you know if it's KVM or Xen or VMWare or something else?</pre>
    </blockquote>
    It is hosted at PCexterme, dutch company. Cheap and good service.
    The use KVM with CloudStack on top of it.<br>
    I mailed/called with one of the sys admins and <span
      id="result_box" class="short_text" lang="en"><span class="">discussed</span></span>
    with him about the problem in the AVX2 extention.<br>
    He told me that they disabled AVX already <span id="result_box"
      class="short_text" lang="en"><span class="">because</span></span>
    of the raid 6 system. It crashes the whole KVM host.<br>
    <br>
    Can give you a vps if you want to. Just 3 euro the month.<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">If it turns out that your VPS host just does something horrible, I'll
look for a way to globally disable kernel usage of AVX2, without
having to patch WireGuard like that.</pre>
    </blockquote>
    If I can found the kernel parmameter for that, I will.<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">If it's particular to the host,
perhaps we can come up with either a particular kernel module to do
the disabling, or some ungodly hack to /dev/kmem...</pre>
    </blockquote>
    You are going above my <span id="result_box" class="short_text"
      lang="en"><span class="">intellect</span></span> of the kernel at
    this point.<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap=""> Are you compiling
your own kernel for this system, or just using stock Ubuntu kernel?</pre>
    </blockquote>
    No not yet. I was planning on this email to tell your my ppa /
    kernel problem.<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">I'm pretty sure, by the way, that we're using the right detection
function within WireGuard, seeing as every other place in the tree
uses the same thing: 		</pre>
    </blockquote>
    * lib/raid6/avx2.c<br>
    * 36:     return boot_cpu_has(X86_FEATURE_AVX2) &amp;&amp;
    boot_cpu_has(X86_FEATURE_AVX);<br>
    I think I'm going to mail/call the hosting company again.<br>
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">
Thanks a bunch for helping out.</pre>
    </blockquote>
    You to with this great this VPN.
    <blockquote
cite="mid:CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com"
      type="cite">
      <pre wrap="">
Jason
_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="http://lists.zx2c4.com/mailman/listinfo/wireguard">http://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------67254D273F5FFD6A6BD0A2B9--
