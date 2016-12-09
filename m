Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 916077f2
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 07:23:53 +0000 (UTC)
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69a2d3f3
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 07:23:53 +0000 (UTC)
Date: Fri, 09 Dec 2016 08:29:27 +0100
From: Anonymous Anonymous <admin@hda.me>
To: "wireguard" <wireguard@lists.zx2c4.com>, "Jason" <jason@zx2c4.com>
Message-Id: <158e27c9da7.122ca5a7e30441.7068723817806019547@hda.me>
In-Reply-To: 
Subject: Re: New contrib/ Utility: wg-config
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_71158_807621822.1481268567465"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_71158_807621822.1481268567465
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Anyway to have env variables in the single config file (without wg wgconf blaming), but not in two files per connection? For ex. make wg wgconf redirect variables from . config file to wg-config to deal with.
Using two files will make wireguard configuration even harder to understand, and this means it presume you need to ask someone who will use your vpn to copy two files instead single configuration file (ovpn style)
I addressed this partly there: https://lists.zx2c4.com/pipermail/wireguard/2016-December/000731.html (just started, without routing)
I can't even imagine machine with 50 connections, thats 100 configuration files (including variables files) and thats will be kind of crazy. And this not the worst example.
I really like idea of single config per connection. And this also will make config easier to import in other software (for example you can import ovpn or config file will openvpn setup in networkmanager).




------=_Part_71158_807621822.1481268567465
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D'font-size:10pt;font-family:Verdana,Arial,Helvetica=
,sans-serif;'>Anyway to have env variables in the single config file (witho=
ut wg wgconf blaming), but not in two files per connection? For ex. make wg=
 wgconf redirect variables from . config file to wg-config to deal with.<br=
>Using two files will make wireguard configuration even harder to understan=
d, and this means it presume you need to ask someone who will use your vpn =
to copy two files instead single configuration file (ovpn style)<br>I addre=
ssed this partly there: https://lists.zx2c4.com/pipermail/wireguard/2016-De=
cember/000731.html (just started, without routing)<br>I can't even imagine =
machine with 50 connections, thats 100 configuration files (including varia=
bles files) and thats will be kind of crazy. And this not the worst example=
.<br>I really like idea of single config per connection. And this also will=
 make config easier to import in other software (for example you can import=
 ovpn or config file will openvpn setup in networkmanager).<br><br><br></di=
v></body></html>
------=_Part_71158_807621822.1481268567465--
