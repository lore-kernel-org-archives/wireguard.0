Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f203375d
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 13:04:49 +0000 (UTC)
Received: from mail.crimel.ro (109.166.220.71 [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dff68948
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 13:04:48 +0000 (UTC)
Subject: Re: Wireguard on Centos 7
To: wireguard@lists.zx2c4.com
References: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
 <CAHmME9pJf1RP_0C1VrqHzEnqaNrAx4XH8snYaAH_h2xJdO3tGw@mail.gmail.com>
 <156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <c48d3e67-f818-8854-1f18-41e0c68cd538@createc.ro>
Date: Fri, 12 May 2017 16:15:31 +0300
MIME-Version: 1.0
In-Reply-To: <156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu>
Content-Type: multipart/alternative;
 boundary="------------F6363DCA18E181CDDE9AF759"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------F6363DCA18E181CDDE9AF759
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12.05.2017 12:47, Christophe Vanlancker wrote:
> I haven't done this kind of work but I'll try giving it a shot. :)
>
>
> Christophe
>
>
> On 12-05-17 11:38, Jason A. Donenfeld wrote:
>> Centos's 3.10 is not kernel.org's 3.10. They patch it heavily. If
>> you'd like to adjust compat.h to support centos's patched-up kernel,
>> without breaking support for other kernels, feel free to submit a
>> patch.
>>
>> Jason
>
Or use the elrepo rpm repositorykernels


regards


--------------F6363DCA18E181CDDE9AF759
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12.05.2017 12:47, Christophe
      Vanlancker wrote:<br>
    </div>
    <blockquote
      cite="mid:156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu"
      type="cite">I haven't done this kind of work but I'll try giving
      it a shot. :)
      <br>
      <br>
      <br>
      Christophe
      <br>
      <br>
      <br>
      On 12-05-17 11:38, Jason A. Donenfeld wrote:
      <br>
      <blockquote type="cite">Centos's 3.10 is not kernel.org's 3.10.
        They patch it heavily. If
        <br>
        you'd like to adjust compat.h to support centos's patched-up
        kernel,
        <br>
        without breaking support for other kernels, feel free to submit
        a
        <br>
        patch.
        <br>
        <br>
        Jason
        <br>
      </blockquote>
      <br>
    </blockquote>
    <p>Or use the elrepo rpm <span style="color: rgb(84, 84, 84);
        font-family: arial, sans-serif; font-size: small; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: normal; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">repository<span
          class="Apple-converted-space"> </span></span>kernels</p>
    <p><br>
    </p>
    <p>regards<br>
    </p>
  </body>
</html>

--------------F6363DCA18E181CDDE9AF759--
