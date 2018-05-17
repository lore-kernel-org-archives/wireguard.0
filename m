Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66935734
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 08:28:54 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc958a9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 08:28:54 +0000 (UTC)
Subject: Re: Need for HW-clock independent timestamps
To: Axel Neumann <neumann@cgws.de>, wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
 <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
 <1526528456.18498.0@mail.makrotopia.org> <20180517100325.1c542b1f@natsu>
 <748e7dbf-0238-6c81-ab18-83d6174405fe@urlichs.de>
 <AA544EA9-A23B-4F49-A468-617F5DF2B035@cgws.de>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <4ff8424c-b964-8003-99c6-ab8ee075846f@urlichs.de>
Date: Thu, 17 May 2018 10:28:31 +0200
MIME-Version: 1.0
In-Reply-To: <AA544EA9-A23B-4F49-A468-617F5DF2B035@cgws.de>
Content-Type: multipart/alternative;
 boundary="------------61EABDAFF2A4F26CE67992D3"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------61EABDAFF2A4F26CE67992D3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 17.05.2018 09:07, Axel Neumann wrote:
>> Wireguard's connection setup is a whole lot simpler than most other
> But only if you ignore the implications coming with NTP transmissions.

The implication is to require a monotonically increasing 96-bit value.
Using NTP is one way to do that. There are obviously others which do not
depend on external protocols and/or services.

-- 
-- Matthias Urlichs


--------------61EABDAFF2A4F26CE67992D3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 17.05.2018 09:07, Axel Neumann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:AA544EA9-A23B-4F49-A468-617F5DF2B035@cgws.de">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">Wireguard's connection setup is a whole lot simpler than most other
</pre>
      </blockquote>
      <pre wrap="">But only if you ignore the implications coming with NTP transmissions.</pre>
    </blockquote>
    <p>The implication is to require a monotonically increasing 96-bit
      value. Using NTP is one way to do that. There are obviously others
      which do not depend on external protocols and/or services.</p>
    <pre class="moz-signature" cols="72">-- 
-- Matthias Urlichs</pre>
  </body>
</html>

--------------61EABDAFF2A4F26CE67992D3--
