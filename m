Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dc69609
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 13:21:49 +0000 (UTC)
Received: from mail.intelterm.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cd97ae1
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 13:21:47 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.68.235])
 by mail.intelterm.ro (Postfix) with ESMTPSA id DF8972218C77
 for <wireguard@lists.zx2c4.com>; Thu, 19 Apr 2018 16:21:52 +0300 (EEST)
Subject: Re: On redhat 7.4 wireguard not working
To: wireguard@lists.zx2c4.com
References: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
 <CAHmME9pHbB8JS9anHpMHXqzbF=Ei_9cw3iXBg8aTSZT59vwBPg@mail.gmail.com>
 <CAPGejTecZFFQ=+fH-1iT4iNQP07Giajcfce+ETe98UzE+k4nJg@mail.gmail.com>
 <CAPGejTe3b26qZA0vAXRJeqkuh8fwcnp1seKGhdfZ4yjH3r3jGw@mail.gmail.com>
 <93ffb22e-1c55-087d-1363-b6f56b643f47@createc.ro>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <589e5d51-3feb-b514-8c26-ff18e7f7d11e@createc.ro>
Date: Thu, 19 Apr 2018 16:21:53 +0300
MIME-Version: 1.0
In-Reply-To: <93ffb22e-1c55-087d-1363-b6f56b643f47@createc.ro>
Content-Type: multipart/alternative;
 boundary="------------1A65983A3636F6788E2AB986"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------1A65983A3636F6788E2AB986
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.04.2018 16:19, Lucian Cristian wrote:
> On 19.04.2018 01:01, Vikas wrote:
>> Just when I thought it worked here are more problems:
>>
>> The steps I followed were:
>>
>> 1. wget 
>> https://rpmfind.net/linux/fedora/linux/releases/25/Everything/x86_64/os/Packages/i/iproute-4.6.0-1.fc25.x86_64.rpm
>>
>> 2. yum install iproute-4.6.0-1.fc25.x86_64.rpm
>>
>> I installed from fc25 since rhel7 does not have an upgraded iproute 
>> package.
>>
>> 3. After installing the iproute 4.6 I do NOT get the error message:
>>
>> "Error: argument "suppress_prefixlength" is wrong: Failed to parse 
>> rule type"
>>
>> 4. ifconfig shows the wg0 interface.
>>
>> 5. After approx 2 minutes my ssh connection to the machine over the 
>> LAN (eth0) gets disconnected.
>>
>> 6. When I ssh back in to the machine, ifconfig does not show the wg0 
>> interface.
>>
>>
>> Please help :(
>>
>>
>>
>> --
>> VK
>>
>> On Wed, Apr 18, 2018 at 2:33 PM, Vikas <kedia.vikas@gmail.com 
>> <mailto:kedia.vikas@gmail.com>> wrote:
>> >
>> > Thank you Jason. Your response is very appreciated along with your 
>> work on the wireguard project.
>> >
>> > 1. Is there a minimum version of iproute2 that is needed?
>> >
>> > 2. Can that be mention in the dependency.
>> >
>> > 3. I installed from source and from the suggested rpm method at 
>> https://www.wireguard.com/install/ would it be possible to check for 
>> version for iproute2 and fail with a error message,
>> >
>> > Regards,
>> >
>> > Vikas
>> >
>> >
>> >
>> > --
>> > VK
>> >
>> > On Wed, Apr 18, 2018 at 2:10 PM, Jason A. Donenfeld 
>> <Jason@zx2c4.com <mailto:Jason@zx2c4.com>> wrote:
>> >>
>> >> You need a newer version of iproute2.
>> >
>> >
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> get the src.rpm and build it on rhel, the rpm binary from fedora 
> should not work and probably is not working
>
> Regards
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

more info https://wiki.centos.org/HowTos/RebuildSRPM

Regards


--------------1A65983A3636F6788E2AB986
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 19.04.2018 16:19, Lucian Cristian
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:93ffb22e-1c55-087d-1363-b6f56b643f47@createc.ro">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 19.04.2018 01:01, Vikas wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAPGejTe3b26qZA0vAXRJeqkuh8fwcnp1seKGhdfZ4yjH3r3jGw@mail.gmail.com">
        <div dir="ltr">Just when I thought it worked here are more
          problems:<br>
          <br>
          The steps I followed were:<br>
          <br>
          <div>1. wget <a
href="https://rpmfind.net/linux/fedora/linux/releases/25/Everything/x86_64/os/Packages/i/iproute-4.6.0-1.fc25.x86_64.rpm"
              moz-do-not-send="true">https://rpmfind.net/linux/fedora/linux/releases/25/Everything/x86_64/os/Packages/i/iproute-4.6.0-1.fc25.x86_64.rpm</a><br>
            <br>
          </div>
          <div>2. yum install iproute-4.6.0-1.fc25.x86_64.rpm<br>
            <br>
            I installed from fc25 since rhel7 does not have an upgraded
            iproute package.<br>
            <br>
            <div>3. After installing the iproute 4.6 I do NOT get the
              error message:<br>
            </div>
            <div><br>
              "Error: argument "suppress_prefixlength" is wrong: Failed
              to parse rule type"<br>
              <br>
              4. ifconfig shows the wg0 interface.
              <div><br>
              </div>
              <div>5. After approx 2 minutes my ssh connection to the
                machine over the LAN (eth0) gets disconnected.</div>
              <div><br>
              </div>
              <div>6. When I ssh back in to the machine, ifconfig does
                not show the wg0 interface.<br>
                <br>
                <br>
                Please help :(<br>
                <br>
                <br>
                <br>
                --<br>
                VK<br>
                <br>
                On Wed, Apr 18, 2018 at 2:33 PM, Vikas &lt;<a
                  href="mailto:kedia.vikas@gmail.com"
                  moz-do-not-send="true">kedia.vikas@gmail.com</a>&gt;
                wrote:<br>
                &gt;<br>
                &gt; Thank you Jason. Your response is very appreciated
                along with your work on the wireguard project.<br>
                &gt;<br>
                &gt; 1. Is there a minimum version of iproute2 that is
                needed?<br>
                &gt;<br>
                &gt; 2. Can that be mention in the dependency.<br>
                &gt;<br>
                &gt; 3. I installed from source and from the suggested
                rpm method at <a
                  href="https://www.wireguard.com/install/"
                  moz-do-not-send="true">https://www.wireguard.com/install/</a>
                would it be possible to check for version for iproute2
                and fail with a error message,<br>
                &gt;<br>
                &gt; Regards,<br>
                &gt;<br>
                &gt; Vikas<br>
                &gt;<br>
                &gt;<br>
                &gt;<br>
                &gt; --<br>
                &gt; VK<br>
                &gt;<br>
                &gt; On Wed, Apr 18, 2018 at 2:10 PM, Jason A. Donenfeld
                &lt;<a href="mailto:Jason@zx2c4.com"
                  moz-do-not-send="true">Jason@zx2c4.com</a>&gt; wrote:<br>
                &gt;&gt;<br>
                &gt;&gt; You need a newer version of iproute2.<br>
                &gt;<br>
                &gt;</div>
            </div>
          </div>
        </div>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
        <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
      </blockquote>
      <p>get the src.rpm and build it on rhel, the rpm binary from
        fedora should not work and probably is not working</p>
      <p>Regards<br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>more info <a class="moz-txt-link-freetext" href="https://wiki.centos.org/HowTos/RebuildSRPM">https://wiki.centos.org/HowTos/RebuildSRPM</a></p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------1A65983A3636F6788E2AB986--
