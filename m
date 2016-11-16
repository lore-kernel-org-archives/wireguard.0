Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 995cf9ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:41:42 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9pWgcg3L9p1m8SPvy1NurLrPeG2E4km-9oEZAgPktZSRg@mail.gmail.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <36857d90-99e4-ddff-3c21-49bde6f8d349@eggiecode.org>
Date: Wed, 16 Nov 2016 15:44:29 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9pWgcg3L9p1m8SPvy1NurLrPeG2E4km-9oEZAgPktZSRg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DF2A88557EA8C8636239C4E6"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Hosting Companies with Dishonest CPUID [Was: Re:
 Seeking Ubuntu PPA Maintainer]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------DF2A88557EA8C8636239C4E6
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hey Jason,

The service/hardware is great. But it is a problem with the raid6 module 
on the host.
That uses AVX/AVX2. PCExtreme hasalready blacklisted AVX because all of 
the virtual machines crashes with it enabled.

I'm the only complaining about AVX2 crashing on the machines, so 
therefore it is not yet blacklisted.

Just sended a email to them, waiting on response. Wanted to add the 
mail, but it is in dutch. I don't know if you can read that.

Greetz,
Egbert


On 2016-11-16 15:14, Jason A. Donenfeld wrote:
> Hey Egbert,
>
> I'm glad that my avx2disabler module worked for you. I believe it
> would be in your interest to pressure the hosting provider into either
> reenabling AVX, or fixing their CPUID to report correct information.
> CPUID is the kernel's only means of judging capabilities, and if the
> [virtual] hardware lies, it is impossible to make a reliable operating
> system.
>
> Jason
>
> On Wed, Nov 16, 2016 at 11:03 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
>> Hey Jason,
>>
>> The kernel module worked for my. ([1020751.674357] AVX2 disabler loaded:
>> 1 -> 0)
>> Going to update the PPA to remove my disable of AVX2.
>>
>> The problem is that the hosting company hides the cpuuid, but from the
>> call with the sysadmin it is a XEON E5-2??? v3.
>>
>> Greetz,
>> Egbert
>>
>>
>> On 2016-11-16 02:31, Jason A. Donenfeld wrote:
>>> Hey Egbert,
>>>
>>> On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
>>>> I mailed/called with one of the sys admins and discussed with him about the
>>>> problem in the AVX2 extention.
>>>> I think I'm going to mail/call the hosting company again.
>>> It seems like the crux of the issue is that if they disable AVX2
>>> instructions, they need to make this known in the CPUID. Otherwise the
>>> operating system will assume it's there when it isn't.
>>>
>>>> Can give you a vps if you want to. Just 3 euro the month.
>>> See the attached tarball. Compile the kernel module in there and load
>>> it BEFORE WireGuard. You might have to manually unload wireguard for
>>> this to work: "rmmod wireguard && insmod ./avx2disabler.ko && modprobe
>>> wireguard", for example. It should disable avx2 inside the kernel,
>>> solving the issue.
>>>
>>> Jason
>>

--------------DF2A88557EA8C8636239C4E6
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hey Jason,</p>
    <p>The service/hardware is great. But it is a problem with the raid6
      module on the host.<br>
      That uses AVX/AVX2. PCExtreme has<span id="result_box"
        class="short_text" lang="en"> <span>already blacklisted AVX </span></span><span
        id="result_box" class="short_text" lang="en"><span class="">because
          all of the virtual machines crashes with it enabled.</span></span></p>
    <p><span id="result_box" class="short_text" lang="en"><span class="">I'm
          the only complaining about AVX2 crashing on the machines, so
          therefore it is not yet blacklisted.</span></span></p>
    <p><span id="result_box" class="short_text" lang="en"><span class="">Just
          sended a email to them, waiting on response. Wanted to add the
          mail, but it is in dutch. I don't </span></span><span
        id="result_box" class="short_text" lang="en"><span class=""><span
            id="result_box" class="short_text" lang="en"><span class="">know
              if you can read that</span></span>.<br>
        </span></span></p>
    <p><span id="result_box" class="short_text" lang="en"><span class="">Greetz,<br>
          Egbert<br>
        </span></span></p>
    <br>
    <div class="moz-cite-prefix">On 2016-11-16 15:14, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHmME9pWgcg3L9p1m8SPvy1NurLrPeG2E4km-9oEZAgPktZSRg@mail.gmail.com"
      type="cite">
      <pre wrap="">Hey Egbert,

I'm glad that my avx2disabler module worked for you. I believe it
would be in your interest to pressure the hosting provider into either
reenabling AVX, or fixing their CPUID to report correct information.
CPUID is the kernel's only means of judging capabilities, and if the
[virtual] hardware lies, it is impossible to make a reliable operating
system.

Jason

On Wed, Nov 16, 2016 at 11:03 AM, Egbert Verhage <a class="moz-txt-link-rfc2396E" href="mailto:egbert@eggiecode.org">&lt;egbert@eggiecode.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hey Jason,

The kernel module worked for my. ([1020751.674357] AVX2 disabler loaded:
1 -&gt; 0)
Going to update the PPA to remove my disable of AVX2.

The problem is that the hosting company hides the cpuuid, but from the
call with the sysadmin it is a XEON E5-2??? v3.

Greetz,
Egbert


On 2016-11-16 02:31, Jason A. Donenfeld wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hey Egbert,

On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <a class="moz-txt-link-rfc2396E" href="mailto:egbert@eggiecode.org">&lt;egbert@eggiecode.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">I mailed/called with one of the sys admins and discussed with him about the
problem in the AVX2 extention.
I think I'm going to mail/call the hosting company again.
</pre>
          </blockquote>
          <pre wrap="">It seems like the crux of the issue is that if they disable AVX2
instructions, they need to make this known in the CPUID. Otherwise the
operating system will assume it's there when it isn't.

</pre>
          <blockquote type="cite">
            <pre wrap="">Can give you a vps if you want to. Just 3 euro the month.
</pre>
          </blockquote>
          <pre wrap="">See the attached tarball. Compile the kernel module in there and load
it BEFORE WireGuard. You might have to manually unload wireguard for
this to work: "rmmod wireguard &amp;&amp; insmod ./avx2disabler.ko &amp;&amp; modprobe
wireguard", for example. It should disable avx2 inside the kernel,
solving the issue.

Jason
</pre>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------DF2A88557EA8C8636239C4E6--
