using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MenuBenQue.Migrations
{
    public partial class updateFK : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn");

            migrationBuilder.RenameColumn(
                name: "NhomChaNhomId",
                table: "NhomMonAn",
                newName: "NhomChaId");

            migrationBuilder.RenameIndex(
                name: "IX_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn",
                newName: "IX_NhomMonAn_NhomChaId");

            migrationBuilder.AddForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaId",
                table: "NhomMonAn",
                column: "NhomChaId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaId",
                table: "NhomMonAn");

            migrationBuilder.RenameColumn(
                name: "NhomChaId",
                table: "NhomMonAn",
                newName: "NhomChaNhomId");

            migrationBuilder.RenameIndex(
                name: "IX_NhomMonAn_NhomChaId",
                table: "NhomMonAn",
                newName: "IX_NhomMonAn_NhomChaNhomId");

            migrationBuilder.AddForeignKey(
                name: "FK_NhomMonAn_NhomMonAn_NhomChaNhomId",
                table: "NhomMonAn",
                column: "NhomChaNhomId",
                principalTable: "NhomMonAn",
                principalColumn: "NhomId");
        }
    }
}
